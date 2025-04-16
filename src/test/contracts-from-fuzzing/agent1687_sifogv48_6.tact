struct OptionalStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract Test {
    st: OptionalStruct;

    init() {
        self.st = OptionalStruct{
            a: null,
            b: true,
            s: null
        };
    }
}