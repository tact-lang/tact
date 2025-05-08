struct OptionalInner {
    a: Int;
    b: Bool;
}

struct Container {
    optionalInner: OptionalInner?;
    count: Int;
}

contract OptionalStructContract {
    data: Container;

    init() {
        self.data = Container{
            optionalInner: null,
            count: 5,
        };
    }
}