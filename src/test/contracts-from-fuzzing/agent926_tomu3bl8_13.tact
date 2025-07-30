struct MultiNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

struct Wrap1 {
    a: MultiNested;
    b: Bool;
}

struct Wrap2 {
    nestedWrap: Wrap1;
    str: String;
}

struct Wrap3 {
    deepest: Wrap2;
    maybeInt: Int?;
}

contract TestContract {
    inner: Wrap3;

    init() {
        self.inner = Wrap3{
            deepest: Wrap2{
                nestedWrap: Wrap1{
                    a: MultiNested{
                        inner1: 1,
                        inner2: true,
                        inner3: "ok"
                    },
                    b: false
                },
                str: "hi"
            },
            maybeInt: 42
        };
    }
}