// test very many optional fields (over 20)
contract Test {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: String?; o7: String?; o8: String?; o9: String?; o10: String?;
    o11: Bool?; o12: Bool?; o13: Bool?; o14: Bool?; o15: Bool?;
    o16: Address?; o17: Address?; o18: Address?; o19: Address?; o20: Address?;
    o21: Cell?; o22: Cell?; o23: Cell?; o24: Cell?; o25: Cell?;

    init() {
        self.o1=null;self.o2=null;self.o3=null;self.o4=null;self.o5=null;
        self.o6=null;self.o7=null;self.o8=null;self.o9=null;self.o10=null;
        self.o11=null;self.o12=null;self.o13=null;self.o14=null;self.o15=null;
        self.o16=null;self.o17=null;self.o18=null;self.o19=null;self.o20=null;
        self.o21=null;self.o22=null;self.o23=null;self.o24=null;self.o25=null;
    }
}