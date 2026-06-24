struct InnerNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    nested: InnerNested;
    flag: Bool;
}

contract DeepNestContract {
    foo: Int;
    container: OuterNested;

    init() {
        self.foo = 10;
        self.container = OuterNested{
            nested: InnerNested{a: 5, b: true},
            flag: false
        };
    }
}
