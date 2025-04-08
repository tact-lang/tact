struct Inner {
    flag: Bool;
    comment: String;
}

struct Outer {
    innerOpt: Inner?;
    description: String;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            innerOpt: Inner{ flag: true, comment: "Yes" },
            description: "Test"
        };
    }
}