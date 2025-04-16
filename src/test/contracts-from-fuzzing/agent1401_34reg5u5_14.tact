contract ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Bool?;
    o6: Bool?;
    o7: Address?;
    o8: String?;

    init() {
        self.o1=1; self.o2=null; self.o3=3; self.o4=null;
        self.o5=true; self.o6=null; self.o7=null; self.o8="x";
    }
}