struct NestedOptional {
    child: Inner?;
}

struct Inner {
    val: Int;
}

contract Test {
    store: NestedOptional;

    init() {
        self.store = NestedOptional{
            child: Inner{
                val: 123
            }
        };
    }
}