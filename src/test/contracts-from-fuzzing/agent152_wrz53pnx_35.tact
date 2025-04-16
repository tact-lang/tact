struct NestedBoolOpt {
    a: Bool?;
}

contract BoolOptTest {
    data: NestedBoolOpt?;

    init() {
        self.data = NestedBoolOpt{ a:null };
    }
}
