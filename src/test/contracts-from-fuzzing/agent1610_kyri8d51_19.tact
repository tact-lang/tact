struct OptionalContainer {
    maybeI: Int?;
    maybeStr: String?;
}
contract OptContTest {
    data: OptionalContainer?;
    init() {
        self.data = OptionalContainer{
            maybeI: 123,
            maybeStr: null
        };
    }
}