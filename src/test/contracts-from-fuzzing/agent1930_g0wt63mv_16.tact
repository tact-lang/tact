struct BigNested {
    x: Int;
    y: Bool;
    z: InnerNested;
}

struct InnerNested {
    a: Int;
    b: String;
    c: DeepInner;
}

struct DeepInner {
    foo: Int;
    bar: Bool;
}

contract TestBig {
    data: BigNested;

    init() {
        self.data = BigNested{
            x: 1,
            y: false,
            z: InnerNested{
                a: 2,
                b: "hi",
                c: DeepInner{
                    foo: 3,
                    bar: true
                }
            }
        };
    }
}