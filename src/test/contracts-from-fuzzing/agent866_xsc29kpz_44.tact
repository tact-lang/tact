struct DefaultNested {
    a: Int = 42;
    b: Bool = true;
}

struct WithNestedDefault {
    x: DefaultNested;
}

contract WithDefNested {
    val: WithNestedDefault;
    init() {
        self.val = WithNestedDefault{ x:DefaultNested{} };
    }
}