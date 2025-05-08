struct OptionalTest {
    label: String?;
    score: Int?;
    flag: Bool?;
}

contract OptionsStorage {
    s: OptionalTest;

    init() {
        self.s = OptionalTest{
            label: null,
            score: 123,
            flag: null,
        };
    }
}
