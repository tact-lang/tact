struct DeepOptional {
    nested: DeepInner?;
}

struct DeepInner {
    nested2: Deeper?;
}

struct Deeper {
    val: Int;
}

contract DeepNestingOptionalTest {
    d: DeepOptional;

    init() {
        self.d = DeepOptional{
            nested: DeepInner{
                nested2: Deeper{
                    val: 999
                }
            }
        };
    }
}