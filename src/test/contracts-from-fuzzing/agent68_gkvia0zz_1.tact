struct NestedOptional {
    innerOpt: Int?;
}

contract DeepOptTest {
    deepField: NestedOptional?;

    init() {
        self.deepField = null;
    }
}