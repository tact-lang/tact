contract OutOfOrderFields {
    b: Int;
    a: Int;

    init() {
        self.b=1;
        self.a=2;
    }
}