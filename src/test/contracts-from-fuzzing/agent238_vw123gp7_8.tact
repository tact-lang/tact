struct OptionalDeep {
    nest: Sub?;
}

struct Sub {
    foo: Int;
    bar: Bool?;
}

contract TestOptDeep {
    st: OptionalDeep;

    init() {
        self.st = OptionalDeep{
            nest: null
        };
    }
}