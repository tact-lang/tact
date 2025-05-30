contract OptStructAndDir {
    num: Int;
    str: String;
    optStr: String?;
    optInt: Int?;
    init(){
        self.num = 7;
        self.str = "hi";
        self.optStr = null;
        self.optInt = null;
    }
}