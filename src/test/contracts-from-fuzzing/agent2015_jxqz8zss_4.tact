struct OptionalStruct {
    a: Int;
    b: String?;
    c: Bool?;
}

contract OptionalFieldTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: 7,
            b: null,
            c: true
        };
    }
}