contract SerializeBoolFirst {
    bb: Bool;
    n1: Int;
    n2: Int;
    n3: Int;
    str: String;

    init() {
        self.bb = true;
        self.n1 = 1;
        self.n2 = 2;
        self.n3 = 3;
        self.str = "abc";
    }
}