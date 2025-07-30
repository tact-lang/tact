// test optional nested struct with deep non-optionals
struct DeepInner {
    x: Int;
    b: Bool;
}

struct MidOpt {
    d: DeepInner?;
}

contract TestContract {
    val: MidOpt;

    init() {
        self.val = MidOpt{
            d: DeepInner{
                x: 5,
                b: true
            }
        };
    }
}