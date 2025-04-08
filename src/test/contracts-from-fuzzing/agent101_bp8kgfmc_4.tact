struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptTest {
    data: OptionalStruct = OptionalStruct{
        a: null,
        b: true,
        c: null,
    };

    init() {
        self.data = OptionalStruct{
            a: 123,
            b: false,
            c: "Hi",
        };
    }
}