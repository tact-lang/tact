struct NestedPoint {
    x: Int as int8;
    y: Int as int8;
}

struct Container {
    id: Int as uint16;
    nested: NestedPoint;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            id: 1234,
            nested: NestedPoint{ x: 12, y: -12 },
            flag: true,
        };
    }
}
