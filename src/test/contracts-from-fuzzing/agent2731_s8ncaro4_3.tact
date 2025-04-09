struct OptionalNest {
    title: String?;
    count: Int?;
    flag: Bool?;
}

contract OptionalFieldsTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            title: null,
            count: null,
            flag: null
        };
    }
}