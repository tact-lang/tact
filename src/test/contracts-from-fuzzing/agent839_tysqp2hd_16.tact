struct InnerMost {
    foo: Int?;
    bar: String?;
}

struct Middle {
    inner: InnerMost?;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    note: String?;
}

contract DeepInit {
    st: Outer;

    init() {
        self.st = Outer{
            mid: Middle{
                inner: InnerMost{
                    foo: 99,
                    bar: null,
                },
                flag: true,
            },
            note: "hi",
        };
    }
}