struct DeepNestedOptional {
    outer: Option1?;
}

struct Option1 {
    inner: Option2?;
}

struct Option2 {
    value: Int;
}

contract OptionalDeepNest {
    val: DeepNestedOptional;

    init() {
        self.val = DeepNestedOptional{
            outer: Option1{
                inner: Option2{
                    value: 1
                }
            }
        };
    }
}