struct Inner {
    intVal: Int = 10;
}

struct Outer {
    nested: Inner;
    optionalNested: Inner?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{ nested: Inner{}, optionalNested: null };
    }
}