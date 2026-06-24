struct Inner {
    val: Int as uint8;
}

struct Container {
    opt: Inner?;
    plain: Inner;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            opt: null,
            plain: Inner{val: 255},
        };
    }
}