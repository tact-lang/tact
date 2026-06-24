contract TrailingCommas {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";

    init() { 
        self.a = 10;
        self.b = false;
        self.c = "done";
    }
}