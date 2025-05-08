struct DeepNestedOpt {
    a: InnerOpt?;
}

struct InnerOpt {
    b: InnerOpt2?;
}

struct InnerOpt2 {
    c: Int;
    d: Bool;
}

contract DeepOptTest {
    val: DeepNestedOpt;
    init() {
        self.val = DeepNestedOpt{
            a: InnerOpt{
                b: InnerOpt2{
                    c: 7,
                    d: true
                }
            }
        };
    }
}