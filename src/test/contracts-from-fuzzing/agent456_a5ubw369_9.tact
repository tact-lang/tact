struct Container {
    n1: Int;
    n2: Int?;
    str: String;
    addr: Address?;
}

contract OptionalAndRequired {
    structField: Container;

    init() {
        self.structField = Container {
            n1: 1,
            n2: null,
            str: "x",
            addr: null
        };
    }
}