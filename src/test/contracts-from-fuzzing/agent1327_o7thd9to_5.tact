struct Inner {
    foo: Int;
    bar: Bool?;
    note: String;
}

struct Container {
    id: Int as uint32;
    optionalInner: Inner?;
    active: Bool;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            id: 42,
            optionalInner: Inner{ foo: 7, bar: null, note: "hi" },
            active: true
        };
    }
}