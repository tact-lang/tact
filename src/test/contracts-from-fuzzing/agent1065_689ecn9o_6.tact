struct NestedOptional {
    innerOpt: Bool?;
    count: Int;
}

struct WithNestedOptional {
    foo: NestedOptional?;
    val: Int;
}

contract NestedOptionalTest {
    s: WithNestedOptional;
    init() {
        self.s = WithNestedOptional{
            foo: NestedOptional{ innerOpt:true, count:1 },
            val: 42
        };
    }
}