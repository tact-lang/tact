struct Inner {
    intVal: Int;
    boolVal: Bool;
}

struct Middle {
    nested: Inner;
}

struct Outer {
    nested: Middle;
}

contract NestedStructsContract {
    field: Outer;

    init() {
        self.field = Outer{
            nested: Middle{
                nested: Inner{
                    intVal: 42,
                    boolVal: true,
                },
            },
        };
    }
}