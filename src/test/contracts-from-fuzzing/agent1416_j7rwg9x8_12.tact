// mix deeply nested optionals and various primitive types in a struct
struct MixedDeep {
    a: Int;
    b: String?;
    c: DeepOpt?;
}

struct DeepOpt {
    d: Bool;
    e: InnerMost?;
}

struct InnerMost {
    s: String;
}

contract MixedDeepTest {
    var1: MixedDeep;
    init() {
        self.var1 = MixedDeep{
            a: 5,
            b: null,
            c: DeepOpt{
                d: true,
                e: InnerMost{s: "hi"}
            }
        };
    }
}