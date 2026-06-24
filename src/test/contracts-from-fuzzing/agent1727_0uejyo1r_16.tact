struct Inner {
    num: Int;
    flag: Bool;
}

struct Outer {
    first: Inner?;
    second: Inner?;
}

contract OptNestedStruct {
    value: Outer;

    init() {
        self.value = Outer{
            first: null,
            second: Inner{ num: 9, flag: true },
        };
    }
}
