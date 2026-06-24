struct Inner {
    x: Int?;
    y: Bool?;
}

struct Container {
    inner: Inner;
}

contract NullableContainer {
    cont: Container?;

    init() {
        self.cont = Container{
            inner: Inner{
                x: 55,
                y: false
            }
        };
    }
}