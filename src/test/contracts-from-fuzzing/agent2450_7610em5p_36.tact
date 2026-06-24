contract SimplePersisted {
    myInt: Int = 5;
    myStr: String = "str";
    myBool: Bool = true;
    
    init() {
        self.myInt = 6;
        self.myStr = "new";
        self.myBool = false;
    }
}
