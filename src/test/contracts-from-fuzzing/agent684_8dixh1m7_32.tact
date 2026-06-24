struct OptionalString {
    s: String?;
}

contract OptionalStringTest {
    f1: OptionalString;
    f2: OptionalString?;
    init() {
        self.f1 = OptionalString { s:null };
        self.f2 = null;
    }
}