struct Deep {
    foo: Int;
    bar: Bool?;
}

contract Test {
    deepOpt: Deep?;

    init() {
        self.deepOpt = null;
    }
}
