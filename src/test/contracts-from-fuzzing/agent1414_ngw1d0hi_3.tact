struct Params {
    flag: Bool;
    count: Int?;
    label: String;
}

contract OptionalFieldsTest {
    data: Params;

    init() {
        self.data = Params{
            flag: true,
            count: null,
            label: "test"
        };
    }
}