contract TestContract {
    a: Int;
    b: Int?;
    c: map<Int, Int>;

    init() {
        self.a = 1;
        self.b = null;
        self.c = emptyMap();
    }
    receive() {}
}