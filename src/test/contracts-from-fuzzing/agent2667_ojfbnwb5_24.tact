struct BoolPrimitiveWithOptional {
    flag: Bool;
    maybeVal: Int?;
}

contract BoolOptTest {
    data: BoolPrimitiveWithOptional;

    init() {
        self.data = BoolPrimitiveWithOptional{flag: false, maybeVal: null};
    }

    receive() {
        self.data = BoolPrimitiveWithOptional{flag: true, maybeVal: 123};
    }
}