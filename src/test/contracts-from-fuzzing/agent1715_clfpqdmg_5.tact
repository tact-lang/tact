struct OptionalDeepNested {
    val: Int?;
    inner: InnerOptional?;
}

struct InnerOptional {
    str: String?;
}

contract OptDeepStructTest {
    deepOpt: OptionalDeepNested;

    init() {
        self.deepOpt = OptionalDeepNested{
            val: null,
            inner: null,
        };
    }
}