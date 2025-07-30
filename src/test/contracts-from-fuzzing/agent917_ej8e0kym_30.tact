struct OptionalString {
    val: String?;
}

contract OptionalStringTest {
    os: OptionalString;

    init() {
        self.os = OptionalString{ val:null };
    }
}