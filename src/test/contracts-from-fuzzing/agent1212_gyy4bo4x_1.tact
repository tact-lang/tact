struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    im: InnerMost;
    s: String;
}

struct Outer {
    inn: Inner;
    flag: Bool;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inn: Inner{
                im: InnerMost{
                    a: 10,
                    b: true,
                },
                s: "test",
            },
            flag: false,
        };
    }
}