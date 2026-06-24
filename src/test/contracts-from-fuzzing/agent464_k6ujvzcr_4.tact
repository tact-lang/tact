struct OptionalNest {
    inner: Int?;
    strVal: String?;
    boolVal: Bool?;
}

contract OptionalTest {
    data: OptionalNest?;

    init() {
        self.data = null;
    }
}