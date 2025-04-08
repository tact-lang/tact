struct NestedOptionals {
    innerOpt: Int?;
    innerBool: Bool?;
}

contract OptOptContract {
    fieldOpt: NestedOptionals?;

    init() {
        self.fieldOpt = NestedOptionals{innerOpt: null, innerBool: null};
    }
}