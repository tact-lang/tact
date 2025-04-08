struct Sub {
    x: Int = 10;
    y: Bool = true;
}

struct MixedDefaults {
    a: Int;
    b: Bool?;
    c: Sub;
}

contract StructWithDefaults {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 1,
            b: null,
            c: Sub{},
        };
    }
}