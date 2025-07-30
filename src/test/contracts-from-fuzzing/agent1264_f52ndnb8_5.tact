struct OptStruct {
    foo: Int?;
    bar: String?;
}

contract OptionalStructInit {
    data: OptStruct;

    init() {
        self.data = OptStruct{};
    }
}