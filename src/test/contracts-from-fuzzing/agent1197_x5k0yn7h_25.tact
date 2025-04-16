// Stress test: large number of optional bool fields in contract persistent state
contract TestContract {
    o1: Bool?;  o2: Bool?;  o3: Bool?;  o4: Bool?;
    o5: Bool?;  o6: Bool?;  o7: Bool?;  o8: Bool?;
    o9: Bool?;  o10: Bool?; o11: Bool?; o12: Bool?;
    o13: Bool?; o14: Bool?; o15: Bool?; o16: Bool?;

    init() {
        self.o1=null; self.o2=null; self.o3=null; self.o4=null;
        self.o5=null; self.o6=null; self.o7=null; self.o8=null;
        self.o9=null; self.o10=null; self.o11=null; self.o12=null;
        self.o13=null; self.o14=null; self.o15=null; self.o16=null;
    }
}