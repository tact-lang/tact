struct Outer {
    a: Int;
    b: Inner;   
}

struct Inner {
    c: Int;
    d: InnerMost;
}

struct InnerMost {
    e: Bool;
    f: String;
}

contract DeepLayers {
    x: Outer;

    init() {
        self.x = Outer{
            a: 1,
            b: Inner{
                c: 2,
                d: InnerMost{ e: true, f: "test" }
            }
        };
    }
}