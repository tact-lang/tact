struct OptionalStruct {
    flag: Bool?;
    number: Int?;
}

contract OptionalTest {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            flag: null,
            number: 123
        };
    }
}