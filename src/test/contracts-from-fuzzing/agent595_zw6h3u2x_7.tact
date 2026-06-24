struct Inner {
    x: Int?;
    y: Bool;
}

struct Outer {
    a: Int;
    b: Bool?;
    c: Inner;
}

contract NestedMixOptional {
    nestedMix: Outer;

    init() {
        self.nestedMix = Outer{
            a: 77,
            b: null,
            c: Inner{
                x: null,
                y: true,
            },
        };
    }
}