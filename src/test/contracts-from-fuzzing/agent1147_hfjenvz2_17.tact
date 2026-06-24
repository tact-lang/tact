contract LongFields {
    a1: Int; a2: Bool; a3: String;
    a4: Int?; a5: String?; a6: Bool?;
    a7: Int; a8: Bool; a9: String;
    a10: Int?; a11: Bool?; a12: String?;

    init() {
        self.a1=1; self.a2=true; self.a3="x";
        self.a4=null; self.a5="y"; self.a6=false;
        self.a7=7; self.a8=true; self.a9="z";
        self.a10=10; self.a11=null; self.a12=null;
    }
}