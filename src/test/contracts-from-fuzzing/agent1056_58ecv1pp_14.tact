struct DefaultsStruct {
    a: Int?; // default null
    b: Bool?; // default null
    c: String?; // default null
}

contract DefaultsTest {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{};  // rely completely on implicit nulls
    }
}