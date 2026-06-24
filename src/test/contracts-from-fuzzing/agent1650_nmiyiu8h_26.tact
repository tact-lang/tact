struct DeepInner {
    num: Int;
    flag: Bool;
}

struct Middle {
    midNum: Int;
    deep: DeepInner;
}

contract OptionalDeepField {
    val: Middle?;

    init() {
        self.val = null;
    }
}