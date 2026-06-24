struct OptionalDeep {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

struct Middle {
    x: OptionalDeep;
    y: Bool = true;
}

contract Test {
    mid: Middle;
    init() {
        self.mid = Middle{ x: OptionalDeep{ foo: null, bar: null, baz: null }, y: true };
    }
}