struct NestedOptional {
    a: Int?;
    b: Bool?;
}

contract LayeredOpt {
    x: NestedOptional?;

    init() {
        self.x = NestedOptional{
            a: 1,
            b: null,
        };
    }
}