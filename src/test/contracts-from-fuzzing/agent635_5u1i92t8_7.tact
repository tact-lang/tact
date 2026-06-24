struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    nested: Inner?;
}

contract NestedOptionals {
    val: Outer;

    init() {
        self.val = Outer{ nested: Inner{ x: 5, y: null } };
    }
}