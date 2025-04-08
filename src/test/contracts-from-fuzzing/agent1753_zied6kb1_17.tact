struct Params {
    foo: Int;
    bar: Bool;
}

contract DefaultValues {
    a: Int = 1;
    b: Bool = true;
    s: Params = Params{foo: 10, bar: false};

    init() {
        self.a = 5;
        self.b = false;
        self.s = Params{foo: 20, bar: true};
    }
}