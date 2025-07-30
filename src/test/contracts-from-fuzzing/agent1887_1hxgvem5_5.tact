struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Int?;
}

contract OptionalVarsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: true,
            c: null,
        };
    }
}