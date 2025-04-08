contract BigPrimitives {
    i1: Int = 0;
    b2: Bool = false;
    s3: String = "";

    init() {
        self.i1 = 1;
        self.b2 = true;
        self.s3 = "abc";
    }
    
    receive() {
        self.i1 = 5;
    }
}