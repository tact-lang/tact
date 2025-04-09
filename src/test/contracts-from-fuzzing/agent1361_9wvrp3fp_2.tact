struct InnerOpt {
    a: Int?;
    b: Bool;
}

contract NestedOptTest {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{a: null, b: false};
    }
}