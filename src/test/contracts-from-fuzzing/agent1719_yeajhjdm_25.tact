struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStructContract {
    os: OptionalStruct?;

    init() {
        self.os = null;
    }
}