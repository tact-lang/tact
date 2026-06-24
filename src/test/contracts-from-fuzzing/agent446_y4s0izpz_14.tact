struct OpNullable {
    optInt: Int?;
    optBool: Bool?;
}

contract Test {
    a: OpNullable;
    b: OpNullable;

    init() {
        self.a = OpNullable{ optInt: null, optBool: true };
        self.b = OpNullable{ optInt: 5, optBool: null };
    }
}