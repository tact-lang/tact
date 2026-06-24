struct InnerNestedOptionals {
    flag: Bool?;
    num: Int?;
}

struct OuterNested {
    inner: InnerNestedOptionals;
    flag2: Bool;
    num2: Int;
}

contract NestedStructPersist {
    data: OuterNested = OuterNested{inner: InnerNestedOptionals{flag: null, num: null}, flag2: true, num2: 10};
    
    init() {
        self.data = OuterNested{inner: InnerNestedOptionals{flag: null, num: null}, flag2: true, num2: 10};
    }
}