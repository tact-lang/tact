struct OptionalInit {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract UninitOptionalStruct {
    data: OptionalInit;
    init() {
        self.data = OptionalInit{};
    }
}