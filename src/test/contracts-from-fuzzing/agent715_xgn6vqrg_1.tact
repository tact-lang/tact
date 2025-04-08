struct OptContainer {
    optionalVal: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: OptContainer;

    init() {
        self.data = OptContainer{ optionalVal: Inner{ x: 17, y: true } };
    }
}