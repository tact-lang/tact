struct OptionalStruct {
    id: Int;
    data: String?;
    flag: Bool?;
}

contract OptTest {
    st: OptionalStruct;

    init() {
        self.st = OptionalStruct{
            id: 5,
            data: null,
            flag: true
        };
    }
}
