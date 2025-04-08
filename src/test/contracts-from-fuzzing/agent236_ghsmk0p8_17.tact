struct Inner {
    i: Int as uint32;
    b: Bool;
    s: String;
    opt: Int?;
}

struct Outer {
    x: Bool;
    nested: Inner;
    y: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: true,
            nested: Inner{
                i: 10,
                b: false,
                s: "hey",
                opt: null
            },
            y: null
        };
    }
}