struct StructWithBool {
    cond: Bool;
}

struct Container {
    val: Int;
    nested: StructWithBool;
    optInner: StructWithBool?;
}

contract NestedOptionals {
    c: Container;

    init() {
        self.c = Container{
            val: 5,
            nested: StructWithBool{ cond: true },
            optInner: null
        };
    }
}