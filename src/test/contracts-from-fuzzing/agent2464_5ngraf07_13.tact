struct OptionalDeepInner {
    deep: Deeper?;
}

struct Deeper {
    val: Int;
}

contract OptDeep {
    s: OptionalDeepInner;

    init() {
        self.s = OptionalDeepInner{
            deep: Deeper{val: 42}
        };
    }
}
