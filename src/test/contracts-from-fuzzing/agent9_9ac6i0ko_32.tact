struct EmptyDefaults {
    a: Int;
    b: String = "";
}

contract ContractEmptyDefaults {
    data: EmptyDefaults = EmptyDefaults{ a: 0 };

    init() {
        self.data = EmptyDefaults{ a:42, b:"x" };
    }
}