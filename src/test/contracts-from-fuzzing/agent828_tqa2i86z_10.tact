struct NestedSerialized {
    count: Int as uint32;
    flag: Bool;
}

struct Container {
    data: NestedSerialized;
    value: Int as int16;
}

contract TestContract {
    composed: Container;

    init() {
        self.composed = Container{
            data: NestedSerialized{
                count: 123456,
                flag: false
            },
            value: -1234
        };
    }
}