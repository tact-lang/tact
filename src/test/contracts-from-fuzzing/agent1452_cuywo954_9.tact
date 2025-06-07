struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptionalStructFieldStorage {
    os: OptionalStruct?;

    init() {
        self.os = OptionalStruct{
            a: null,
            b: true
        };
    }
}
