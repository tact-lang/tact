struct DeepInner {
    val: String;
}

struct Outer {
    nested: DeepInner;
    num: Int;
}

contract DeepTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: DeepInner{ val: "deep" },
            num: 42
        };
    }
}