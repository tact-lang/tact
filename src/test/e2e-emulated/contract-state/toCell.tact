struct State {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
}

contract Test(s: State) {
    receive() {}

    get fun checkCells(): Bool {
        return self.s.toCell() == self.toCell();
    }

    get fun state(): State {
        return self.s;
    }
}
