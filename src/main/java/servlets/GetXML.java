package servlets;

import model.Power;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

/**
 * Created by nikolay on 08.05.17.
 */
public class GetXML extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Power power = (Power) req.getSession().getAttribute("power");
        if (power != null) {
            OutputStream outputStream = null;
            try {
                resp.setContentType("text/xml");
                JAXBContext jaxbContext = JAXBContext.newInstance(Power.class);
                Marshaller marshaller = jaxbContext.createMarshaller();
                outputStream = resp.getOutputStream();
                marshaller.marshal(power, outputStream);
                outputStream.flush();
            } catch (JAXBException e) {
                e.printStackTrace();
            } finally {
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        } else {
            PrintWriter writer = resp.getWriter();
            writer.print("Something wrong!");
            writer.flush();
            writer.close();
        }
    }
}
