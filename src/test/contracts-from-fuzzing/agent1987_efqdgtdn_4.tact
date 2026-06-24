struct OptionalTest {
    amount: Int?;
    flag: Bool?;
    note: String?;
}

contract OptionalContract {
    data: OptionalTest;
    init() {
        self.data = OptionalTest{
            amount: null,
            flag: true,
            note: null
        };
    }
}