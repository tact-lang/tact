struct Inner {
    a: Int;
    b: Bool;
}

struct Container {
    i: Inner?;
    val: Int?;
}

contract OptionalContainer {
    field: Container;

    init() {
        self.field = Container{
            i: null,
            val: null,
        };
    }
}