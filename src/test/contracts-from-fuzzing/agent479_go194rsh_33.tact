struct OptionalString {
    val: String?;
}
contract OptionalStringTest {
    s: OptionalString;
    init() { self.s = OptionalString{ val: null }; }
}