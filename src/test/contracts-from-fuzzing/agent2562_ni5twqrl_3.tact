struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    note: String;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    a: 123,
                    b: false,
                },
                flag: true,
            },
            note: "deep"
        };
    }
}