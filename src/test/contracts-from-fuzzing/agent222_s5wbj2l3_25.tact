contract ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
    o5: Address?;
    o6: Cell?;
    o7: Slice?;

    init() {
        self.o1=null; self.o2=1;
        self.o3=null; self.o4=true;
        self.o5=null; self.o6=null;
        self.o7=null;
    }
}