struct EmbeddedNest {
    a: Int;
    b: InnerMost;
}

struct InnerMost {
    x: Int;
    y: String;
    z: Bool;
}

contract NestedStructTest {
    val: EmbeddedNest;

    init() {
        self.val = EmbeddedNest{
            a: 1,
            b: InnerMost{
                x:2, y:"inner", z:true
            }
        };
    }
}