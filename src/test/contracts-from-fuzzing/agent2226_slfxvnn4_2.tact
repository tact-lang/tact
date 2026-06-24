struct Inner {
    flag: Bool;
    message: String;
    num: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract NestedContract {
    nested: Outer;
    init() {
        self.nested = Outer{
            inner1: Inner{
                flag: true,
                message: "a",
                num: 1,
            },
            inner2: Inner{
                flag: false,
                message: "b",
                num: 2,
            }
        };
    }
}
