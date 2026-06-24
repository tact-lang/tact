struct Deep {
    foo: String;
    bar: Int;
}

contract OptionalDeep {
    deepOpt: Deep?;

    init() {
        self.deepOpt = null;
    }
}