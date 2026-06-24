struct Base {
    id: Int;
}

struct Wrap {
    inner: Base?;
    name: String;
}

struct Outermost {
    nested: Wrap;
    count: Int;
}

contract OptionalInDeep {
    data: Outermost;

    init() {
        self.data = Outermost{
            nested: Wrap{ inner: null, name: "x" },
            count: 22,
        };
    }
}