contract Test {
    a: Int;

    init(a: Int) {
        self.a = a;
    }

    receive() {}

    get fun asCell(): Cell {
        return self.toCell();
    }
}
