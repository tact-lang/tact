struct Outer {
    innerOpt: Inner?;
    num: Int;
}

struct Inner {
    flag: Bool;
    val: Int;
}

contract OptionalNestedStruct {
    data: Outer;
    init() {
        self.data = Outer{
            innerOpt: null,
            num: 123
        };
    }
}