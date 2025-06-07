struct Opts {
    x: Int?;
    y: Bool?;
}

contract Test {
    param: Int;
    data: Opts;

    init() {
        self.param = 55;
        self.data = Opts{
            x: null,
            y: null
        };
    }
}
