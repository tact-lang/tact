struct Inner {
    x: Int as uint8;
    s: String?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract Test35 {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                x: 3,
                s: null,
            },
            flag: false,
        };
    }
}