struct Deep {
    x: Int;
    y: Bool?;
    nested: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestDeep {
    value: Deep;

    init() {
        self.value = Deep{
            x: 5,
            y: null,
            nested: Inner{ a: 2, b: false }
        };
    }
}