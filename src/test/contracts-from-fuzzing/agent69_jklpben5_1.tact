struct DeepNest {
    inner: InnerOptional;
}

struct InnerOptional {
    nested: NestedOptional;
}

struct NestedOptional {
    val: Int?;
}

contract DeepOptionalTest {
    s: DeepNest;
    
    init() {
        self.s = DeepNest{
            inner: InnerOptional{
                nested: NestedOptional{
                    val: null
                }
            }
        };
    }
}
