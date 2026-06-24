// large number of optional primitive fields
contract Test {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
    o7: Builder?;
    o8: Int?;
    o9: Bool?;
    o10: String?;
    o11: Address?;
    o12: Cell?;
    o13: Slice?;
    o14: Builder?;

    init() {
        // all null
        self.o1=null;self.o2=null;self.o3=null;self.o4=null;
        self.o5=null;self.o6=null;self.o7=null;self.o8=null;
        self.o9=null;self.o10=null;self.o11=null;self.o12=null;
        self.o13=null;self.o14=null;
    }
}