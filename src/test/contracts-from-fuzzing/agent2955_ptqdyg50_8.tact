struct Data {
    number: Int = 42;
    flag: Bool = true;
    message: String = "hello";
    opt: Int?;
}

contract StructDefaults {
    field: Data;

    init() {
        self.field = Data{};
    }
}
