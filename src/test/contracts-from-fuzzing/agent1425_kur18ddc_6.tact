struct Inner {
    val1: Int?;
    val2: Bool;
}

struct Middle {
    innerOpt: Inner?;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    description: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                innerOpt: null,
                flag: true
            },
            description: "Nested test"
        };
    }

    receive() {}
}