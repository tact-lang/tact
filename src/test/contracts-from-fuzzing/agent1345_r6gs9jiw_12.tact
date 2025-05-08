struct InnerOpt {
    a: Int?;
}

struct DoubleNestOpt {
    x: InnerOpt?;
}

contract MultiOptNestTest {
    val: DoubleNestOpt;

    init() {
        self.val = DoubleNestOpt{
            x: InnerOpt{ a: null }
        };
    }
}