struct Opts {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    nested: Opts = Opts{a: null, c: null};
    receive() {
        self.nested = Opts{a: 1, b: true, c: 2, d: false};
    }
}