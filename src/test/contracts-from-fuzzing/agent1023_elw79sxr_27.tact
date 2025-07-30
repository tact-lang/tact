struct Wrapper {
    x: Int;
    y: Bool?;
}

struct Container {
    wrap: Wrapper?;
    val: Int;
}

contract OptionalWrapper {
    field: Container;

    init() {
        self.field = Container{ wrap: null, val: 7 };
    }
}