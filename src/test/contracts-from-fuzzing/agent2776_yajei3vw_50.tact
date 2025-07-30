struct BoolWrapOpt {
    b: Bool?;
}
contract BoolOptTest {
    w: BoolWrapOpt;
    init() {
        self.w = BoolWrapOpt{ b: null };
    }
}
