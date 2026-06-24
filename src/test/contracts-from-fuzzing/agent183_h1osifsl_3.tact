struct DeepNestedOptional {
    val: Int?;
}

struct MidNestedOptional {
    deep: DeepNestedOptional?;
}

struct OuterOptional {
    mid: MidNestedOptional?;
}

contract TestContract {
    nested: OuterOptional?;
    
    init() {
        self.nested = OuterOptional{
            mid: MidNestedOptional{
                deep: DeepNestedOptional{val: null}
            }
        };
    }
}