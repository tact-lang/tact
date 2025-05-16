struct TailRem {
    a: Int;
    b: Int as uint32;
    rest: Slice as remaining;
}

contract RemainOpt {
    data: TailRem;

    init() {
        self.data = TailRem{ a:1, b:2, rest:emptyCell().asSlice() };
    }
}