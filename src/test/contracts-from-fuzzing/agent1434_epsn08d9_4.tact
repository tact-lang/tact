struct OptionalNest {
    inner: Inner?;
}

struct Inner {
    boolVal: Bool;
    intVal: Int;
}

contract Test {
    state: OptionalNest = OptionalNest{
        inner: null
    };

    receive() {}
}