contract Foo {
    a: Int?; 
    b: String?;
    c: Bool?;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }

    receive() {
        self.a = 5;
        self.b = "hi";
        self.c = true;
    }
}