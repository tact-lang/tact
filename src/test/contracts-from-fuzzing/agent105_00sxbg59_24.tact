struct OptNestedNested {
    a: Int;
    b: Bool;
}

struct OptNested {
    nested: OptNestedNested?;
}

contract OptNestedContract {
    val: OptNested;

    init() {
        self.val = OptNested{
            nested: null,
        };
    }
}