struct InnerMost {
    x: Int;
}

struct Inner {
    y: Int;
    z: InnerMost;
    opt: Bool?;
}

struct Outer {
    a: Int;
    b: Bool;
    c: String;
    d: Inner;
    opt2: String?;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            b: true,
            c: "ok",
            d: Inner{
                y: 2,
                z: InnerMost{ x: 3 },
                opt: false
            },
            opt2: "bye"
        };
    }
}