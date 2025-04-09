struct OptionalInner {
    x: Int?;
    y: Bool?;
}

struct Container {
    inner: OptionalInner;
}

contract OptionalNested {
    data: Container;

    init() {
        self.data = Container{
            inner: OptionalInner{
                x: null,
                y: null
            }
        };
    }
}