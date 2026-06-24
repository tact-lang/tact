struct OptStruct {
    a: Int?;
    b: Bool?;
    name: String = "abc";
}

contract OptionalTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{};
    }
}