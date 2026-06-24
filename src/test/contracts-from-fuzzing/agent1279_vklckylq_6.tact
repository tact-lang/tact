struct OptTest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalInStruct {
    data: OptTest;

    init() {
        self.data = OptTest{
            a: null,
            b: true,
            c: "test",
        };
    }
}