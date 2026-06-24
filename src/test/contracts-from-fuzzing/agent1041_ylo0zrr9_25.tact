struct OptionalDeepInner {
    val: Int;
    deeper: InnerMost?;
}

struct InnerMost {
    flag: Bool;
    text: String?;
}

contract OptionalWithInner {
    data: OptionalDeepInner?;

    init() {
        self.data = OptionalDeepInner{
            val: 7,
            deeper: null
        };
    }
}
