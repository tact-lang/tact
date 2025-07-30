struct TinyInt {
    x: Int as uint1;
}

contract Test {
    t: TinyInt;

    init() {
        self.t = TinyInt{ x: 1 };
    }
}