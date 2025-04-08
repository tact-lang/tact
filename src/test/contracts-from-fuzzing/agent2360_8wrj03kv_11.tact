// Testing optional struct with defaults
struct DefaultsTest {
    a: Int = 1;
    b: Bool = false;
    c: String = "ok";
    d: Int?; // default null
    e: Bool?; // default null
}

contract DefaultsStruct {
    data: DefaultsTest;
    init() {
        self.data = DefaultsTest{};
    }
}