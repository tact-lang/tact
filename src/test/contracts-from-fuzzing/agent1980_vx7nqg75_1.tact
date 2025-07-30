struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    coord: Inner;
    flagOpt: Bool?;

    init() {
        self.field1 = 10;
        self.field2 = true;
        self.coord = Inner{x: 1, y: null};
        self.flagOpt = null;
    }
}