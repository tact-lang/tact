struct OptionalNested {
    inner: Int?;
    text: String;
}

contract InnerOptTest {
    param: OptionalNested?;
    init() {
        self.param = null;
    }
}
