contract TestContract {
    i1: Int = 0;
    b1: Bool = false;
    a1: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    s1: String = "Hello";
    c1: Cell;

    init() {
        self.i1 = 10;
        self.b1 = true;
        self.a1 = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.s1 = "World";
        self.c1 = beginCell().endCell();
    }
}