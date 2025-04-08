struct OptionalDeepNest {
    a: Int?;
    b: OptionalLevel1?;
}

struct OptionalLevel1 {
    c: OptionalLevel2?;
}

struct OptionalLevel2 {
    d: Int;
}

contract OptionalDeepNestedContract {
    val: OptionalDeepNest;

    init() {
        self.val = OptionalDeepNest{
            a: null,
            b: OptionalLevel1{
                c: OptionalLevel2{ d: 50 }
            }
        };
    }
}