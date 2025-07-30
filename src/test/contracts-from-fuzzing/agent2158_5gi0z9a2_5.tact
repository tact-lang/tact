struct NestedOptional {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    number: Int;
    valid: Bool;
}

contract NestedOptionalFieldTest {
    value: NestedOptional;
    
    init() {
        self.value = NestedOptional{ innerOpt: null };
    }
}