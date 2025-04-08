struct InnerMost {
    foo: Int;
    cond: Bool;
}

struct Middle {
    inner: InnerMost;
    comment: String;
}

struct Outer {
    middle: Middle;
    name: String;
    active: Bool;
}

contract DeepStructs {
    mainData: Outer;

    init() {
        self.mainData = Outer{
            middle: Middle{
                inner: InnerMost{
                    foo: 5,
                    cond: true
                },
                comment: "Hello"
            },
            name: "DeepTest",
            active: false
        };
    }
}