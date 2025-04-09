struct Inner {
    str: String;
    flag: Bool;
}

struct Wrapper {
    optInner: Inner?;
    amount: Int;
}

contract OptionalNestedStruct {
    value: Wrapper;

    init() {
        self.value = Wrapper{
            optInner: null,
            amount: 123
        };
    }
}