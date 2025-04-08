// nested optional struct with default fields not initialized
struct NestedDefOptInner {
    x: Int = 42;
    y: Bool = true;
}
struct NestedDefOpt {
    inner: NestedDefOptInner?;
    note: String = "hi";
}

contract NestedDefOptTest {
    data: NestedDefOpt;
    init() {
        self.data = NestedDefOpt{ inner: null };
    }
}