struct InnerOpt {
    deep: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
    val: Int;
}

contract DeepOptionalTest {
    nestedOpt: OuterOpt;

    init() {
        self.nestedOpt = OuterOpt{
            inner: null,
            val: 42
        };
    }
}