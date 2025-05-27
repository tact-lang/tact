struct State {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Builder;
    f: String;
}

contract Test(s: State) {
    receive() {}

    get fun left(): Slice { return self.s.toSlice() }
    get fun right(): Slice { return self.toSlice() }

    get fun state(): State {
        return self.s;
    }
}
