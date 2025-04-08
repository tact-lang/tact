struct DeepInnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: DeepInnerOpt?;
}

contract Test13 {
    oo: OuterOpt;

    init() {
        self.oo = OuterOpt{
            inner: null,
        };
    }

    receive() {}
}