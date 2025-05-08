struct DeepInner {
    flag: Bool;
    count: Int;
    opt: Int?;
}

struct Nested {
    innerVal: Int;
    deep: DeepInner;
}

contract TestNested {
    myVal: Int;
    nested: Nested;

    init() {
        self.myVal = 0;
        self.nested = Nested{
            innerVal: 42,
            deep: DeepInner{flag: true, count: 1, opt: null}
        };
    }
}