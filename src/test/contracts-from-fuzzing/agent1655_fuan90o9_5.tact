struct NestOptDefaults {
    s: String = "hello";
    n: Int?;
}

contract ContractDefaults {
    data: NestOptDefaults;

    init() {
        self.data = NestOptDefaults{};
    }
}
