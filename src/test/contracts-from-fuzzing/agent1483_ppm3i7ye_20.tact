struct IntLeaf {
    val: Int;
}

struct OptionalWithDefault {
    o: Int? = null;
}

struct Composite {
    leaf: IntLeaf;
    other: OptionalWithDefault;
}

contract OptionalWithDefaultsTest {
    c: Composite;

    init() {
        self.c = Composite{
            leaf: IntLeaf{ val: 1 },
            other: OptionalWithDefault{}
        };
    }
}