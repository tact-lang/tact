struct Opts {
    a: Int?;
    b: Cell?;
}

contract Test {
    saved: Opts;

    init() {
        self.saved = Opts{
            a: null,
            b: null,
        };
    }
}