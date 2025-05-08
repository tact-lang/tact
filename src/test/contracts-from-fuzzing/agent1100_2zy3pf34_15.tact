struct OptionalStringStruct {
    text: String?;
    flag: Bool;
}

contract OptionalStringTest {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{
            text: null,
            flag: true
        };
    }
}
