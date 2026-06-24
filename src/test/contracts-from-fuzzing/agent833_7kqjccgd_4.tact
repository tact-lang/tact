struct WithOptional {
    a: Int;
    b: Bool?;
    c: String?;
}

contract StorageOptionals {
    info: WithOptional;

    init() {
        self.info = WithOptional{
            a: 42,
            b: null,
            c: "hello",
        };
    }
}