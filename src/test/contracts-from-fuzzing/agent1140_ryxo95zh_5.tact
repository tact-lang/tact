struct OptionalTest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStorage {
    info: OptionalTest;
    init() {
        self.info = OptionalTest{
            a: null,
            b: null,
            c: null
        };
    }
}