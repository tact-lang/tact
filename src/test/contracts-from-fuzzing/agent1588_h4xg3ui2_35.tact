struct ComposeOpt {
    x: Int?;
    y: InnerOpt2?;
}

struct InnerOpt2 {
    foo: Int?;
    bar: String?;
}

contract ComposeOptTest {
    s: ComposeOpt;
    init() {
        self.s = ComposeOpt {
            x: null,
            y: null,
        };
    }
}