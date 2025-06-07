struct OptTest {
    name: String?;
    age: Int?;
    flag: Bool?;
}

contract OptionalFields {
    data: OptTest;

    init() {
        self.data = OptTest{
            name: null,
            age: null,
            flag: true
        };
    }
}