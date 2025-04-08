contract DefaultsForPrimitives {
    n: Int = 0;
    b: Bool = false;
    txt: String = "";

    init() {
        self.n = 123;
        self.b = true;
        self.txt = "hello";
    }
    
    receive() {
        let _ = self.n;
    }
}