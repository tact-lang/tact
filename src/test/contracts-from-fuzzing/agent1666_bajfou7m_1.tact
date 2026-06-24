contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
    }

    receive() {}
}