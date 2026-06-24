contract LargeOptionalChain {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Bool?;
    o5: String?;

    init() {
        self.o1=1;
        self.o2=null;
        self.o3=3;
        self.o4=true;
        self.o5="str";
    }
}