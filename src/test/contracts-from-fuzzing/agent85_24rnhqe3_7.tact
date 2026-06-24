struct NestedOptional {
    innerOpt: Int?;
    boolOpt: Bool?;
}

contract Test {
    x: NestedOptional;
    init() {
        self.x = NestedOptional{
            innerOpt: null,
            boolOpt: true
        };
    }
}