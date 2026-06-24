contract ReorderInit {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;

    init() {
        self.c = 10;
        self.a = 5;
        self.b = 6;
    }
}