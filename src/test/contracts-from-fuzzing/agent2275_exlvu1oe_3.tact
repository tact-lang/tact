struct OptionalStruct {
    s: String?;
}

contract OptionalTest {
    os: OptionalStruct;
    init() {
        self.os = OptionalStruct{ s: null };
    }
}