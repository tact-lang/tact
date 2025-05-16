struct DeepInlineOpt {
    x: Int;
    innerOpt: DeepInlineOpt2?;
}

struct DeepInlineOpt2 {
    y: Int;
    innerOpt: DeepInlineOpt3?;
}

struct DeepInlineOpt3 {
    z: Int;
}

contract InlineDerefOptTest {
    val: DeepInlineOpt;

    init() {
        self.val = DeepInlineOpt{
            x: 1,
            innerOpt: DeepInlineOpt2{
                y: 2,
                innerOpt: DeepInlineOpt3{
                    z: 3
                }
            }
        };
    }
}
