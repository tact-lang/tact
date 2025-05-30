struct DeepOpt {
    inner: InnerOpt?;
    val: Int;
}

struct InnerOpt {
    a: Int;
    b: Bool?;
}

contract Test {
    d: DeepOpt;
    init() {
        self.d = DeepOpt{
            inner: null,
            val: 5
        };
    }
}