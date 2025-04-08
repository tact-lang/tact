struct OptionalNested {
    lvl2: Inner?;
    val: Int;
}

struct Inner {
    leaf: Int;
}

contract NestedOptionals {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            lvl2: null,
            val: 99
        };
    }
}