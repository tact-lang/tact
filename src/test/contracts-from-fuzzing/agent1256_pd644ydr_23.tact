contract SerializeOrder {
    int1: Int;
    str1: String;
    bool1: Bool;
    optInt: Int?;
    bool2: Bool;

    init() {
        self.bool2=true;
        self.optInt=null;
        self.bool1=false;
        self.str1="serial";
        self.int1=123;
    }
}
