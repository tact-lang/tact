struct Sub {
    a: Int;
    b: Bool?;
    c: String;
}

struct Super {
    s: Sub;
    x: Int?;
    y: Bool;
    z: String?;
}

contract NestedStructComplex {
    val: Super;

    init() {
        self.val = Super{
            s: Sub{
                a: 10,
                b: null,
                c: "sub",
            },
            x: null,
            y: true,
            z: null,
        };
    }
}