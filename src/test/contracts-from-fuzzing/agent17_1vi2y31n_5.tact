struct NestedDefault {
    a: Int = 5;
    b: String = "foo";
}

struct Container {
    c: NestedDefault;
    d: Bool;
}

contract DefaultNested {
    val: Container;

    init() {
        self.val = Container{ c: NestedDefault{}, d: true };
    }
}