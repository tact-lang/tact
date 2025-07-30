struct OptionalTest {
    name: String?;
    amount: Int?;
    flag: Bool?;
}

contract TestContract {
    val: OptionalTest;

    init() {
        self.val = OptionalTest{
            name: null,
            amount: null,
            flag: null,
        };
    }
}