struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String?;
    d: Bool?;
}

contract MixedDeep {
    data: Outer;

    init() {
        self.data = Outer{
            a: 10,
            b: Inner{
                x: 11,
                y: true
            },
            c: null,
            d: null
        };
    }

    receive() {}
}