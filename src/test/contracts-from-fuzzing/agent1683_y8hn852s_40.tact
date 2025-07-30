struct OptNesting {
    nested1: Int?;
    nested2: String?;
    nested3: Bool?;
}

contract ManyOptionalFields {
    foo: OptNesting;

    init() {
        self.foo = OptNesting{};
    }

    receive() {
        self.foo = OptNesting{ nested1:1, nested2:"x", nested3:true };
    }
}