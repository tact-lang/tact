struct OptionalDeep {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    stuff: OptionalDeep;

    init() {
        self.stuff = OptionalDeep{ a: null, b: Inner{ x: 1, y: null } };
    }
}