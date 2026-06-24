struct OptionalTest {
    a: Int?;
    b: Bool?;
}

contract OptStruct {
    data: OptionalTest;
    init() {
        self.data = OptionalTest{a: null, b: true};
    }
}