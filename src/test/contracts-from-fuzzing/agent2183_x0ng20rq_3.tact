struct DeeplyNested {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: DeeplyNested;
    msg: String;
}

struct Outer {
    middle: Middle;
    s: String;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            middle: Middle{
                inner: DeeplyNested{
                    x: 42,
                    y: true
                },
                msg: "hi"
            },
            s: "hello"
        };
    }
}