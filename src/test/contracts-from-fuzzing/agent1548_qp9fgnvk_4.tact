struct OptFields {
    foo: Int?;
    bar: Bool?;
    name: String?;
}

contract Test {
    opts: OptFields;

    init() {
        self.opts = OptFields{
            foo: null,
            bar: true,
            name: null
        };
    }
}