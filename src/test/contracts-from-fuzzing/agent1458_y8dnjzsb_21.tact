struct Tail {
    prefix: Int;
    rest: Slice as remaining;
}

contract Test {
    t: Tail;

    init() {
        self.t = Tail{
            prefix: 7,
            rest: emptyCell().asSlice(),
        };
    }
}