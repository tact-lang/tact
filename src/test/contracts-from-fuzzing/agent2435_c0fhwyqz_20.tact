struct NestedWithOptionals {
    inner1: Inner?;
    inner2: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            inner1: null,
            inner2: Inner{x: 5, y: true},
        };
    }
}