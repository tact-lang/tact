struct NestedOptionals {
    x: Int?;
    sub: SubOpt?;
}

struct SubOpt {
    y: Bool?;
}

contract OptionalDeepTest {
    val: NestedOptionals;
    init() {
        self.val = NestedOptionals{
            x: null,
            sub: null
        };
    }
}