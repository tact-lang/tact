// nested contract persistent field with optional nested struct initialized via default (null)
struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract InnerOptTest {
    data: OptionalInner?;
    init() {
        self.data = null;
    }
}