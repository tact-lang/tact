struct OptionalsTest {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalsStorage {
    data: OptionalsTest;

    init() {
        self.data = OptionalsTest{
            optInt: null,
            optBool: true,
            optString: null,
        };
    }
}