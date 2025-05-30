struct Inner {
    id: Int;
    flag: Bool?;
}

struct Outer {
    data: Int;
    nested: Inner?;
}

contract TestNestedOptionalField {
    state: Outer;

    init() {
        self.state = Outer{
            data: 1,
            nested: null
        };
    }

    receive() {
        let _ = self.state;
    }
}