struct Defaults {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "hi";
    valOpt: Int?;
}

contract Test {
    data: Defaults;

    init() {
        self.data = Defaults{ valOpt: null };
    }
}