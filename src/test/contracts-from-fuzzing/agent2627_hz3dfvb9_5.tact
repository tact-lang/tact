struct NestedOptional {
    innerOpt: Int?;
}

struct Wrapper {
    fieldA: Int;
    fieldB: NestedOptional?;
}

contract ComplexOpt {
    opt: Wrapper;
    
    init() {
        self.opt = Wrapper{
            fieldA: 42,
            fieldB: NestedOptional{innerOpt: null}
        };
    }
}