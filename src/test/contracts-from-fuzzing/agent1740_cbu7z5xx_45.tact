contract BoolIntString {
    a: Bool = false;
    b: Int = 123;
    c: String = "hello";
    
    receive() {
        self.a = !self.a;
        self.b += 1;
        self.c = "done";
    }
}