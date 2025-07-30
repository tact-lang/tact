// Compose a contract with a large number of optional fields
contract ManyNullables {
    pa: Int? = null;
    pb: Int? = null;
    pc: Int? = null;
    pd: Int? = null;
    pe: Int? = null;
    pf: Int? = null;
    pg: Int? = null;
    ph: Int? = null;
    pi: Int? = null;
    pj: Int? = null;

    init() {
        self.pa = 1;
        self.pb = 2;
        self.pc = 3;
        self.pd = 4;
        self.pe = 5;
        self.pf = 6;
        self.pg = 7;
        self.ph = 8;
        self.pi = 9;
        self.pj = 10;
    }
}