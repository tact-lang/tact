struct WithSerialization {
    a: Int as uint32;
    b: Bool;
    c: Int?;
}

contract PersistWithSerialization {
    state: WithSerialization;

    init() {
        self.state = WithSerialization{
            a: 123,
            b: true,
            c: null,
        };
    }
}