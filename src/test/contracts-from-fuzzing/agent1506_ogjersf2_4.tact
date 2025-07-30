struct InnerMost {
    z: String;
    flag: Bool?;
}

struct Inner {
    y: Int;
    next: InnerMost;
}

struct Outer {
    x: Int?;
    nested: Inner;
}

contract TestContract {
    info: Outer;

    init() {
        self.info = Outer{
            x: null,
            nested: Inner{
                y: 10,
                next: InnerMost{
                    z: "deep",
                    flag: true,
                },
            },
        };
    }
}