struct Opt {
    x: Int?;
}

contract Test {
    optField: Opt;

    init() {
        self.optField = Opt{x: null};
    }
}