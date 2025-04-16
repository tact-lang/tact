struct Sub {
    a: Int;
}

struct Container {
    one: Int;
    two: Sub?;
}

contract OptionalRightAfterInt {
    field: Container;

    init() {
        self.field = Container{
            one: 1,
            two: null,
        };
    }
}