package model;

import com.sun.istack.internal.NotNull;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by nikolay on 07.05.17.
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Power {
    @NotNull
    @XmlElement
    private double base;
    @NotNull
    @XmlElement
    private double exp;
    @NotNull
    @XmlElement
    private double result;

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getExp() {
        return exp;
    }

    public void setExp(double exp) {
        this.exp = exp;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    public Power(double base, double exp) {
        this.base = base;
        this.exp = exp;
    }

    public Power() {
    }
}
