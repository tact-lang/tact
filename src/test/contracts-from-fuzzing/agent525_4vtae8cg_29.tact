// contract with dozens of optional top-level fields
contract ManyOptionals {
    o1: Int?; o2: Int?; o3: Int?; o4: Int?; o5: Int?;
    o6: Int?; o7: Int?; o8: Int?; o9: Int?; o10: Int?;
    o11: Bool?; o12: Bool?; o13: Bool?; o14: Bool?; o15: Bool?;
    o16: Bool?; o17: Bool?; o18: Bool?; o19: Bool?; o20: Bool?;

    init() {
      self.o1=null;self.o2=1;self.o3=null;self.o4=4;self.o5=5;
      self.o6=6;self.o7=null;self.o8=8;self.o9=9;self.o10=10;
      self.o11=true;self.o12=false;self.o13=true;self.o14=false;self.o15=true;
      self.o16=false;self.o17=true;self.o18=false;self.o19=true;self.o20=false;
    }
}