struct Inner {
    flag: Bool;
    text: String;
}

struct Middle {
    count: Int;
    inner: Inner;
}

struct Outer {
    value: Int;
    middle: Middle;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            value: 42,
            middle: Middle{
                count: 7,
                inner: Inner{
                    flag: true,
                    text: "hello",
                },
            },
        };
    }
}