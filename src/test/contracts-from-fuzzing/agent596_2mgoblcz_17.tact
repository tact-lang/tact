struct DeepInner {
    a: Int = 1;
}

struct Middle {
    deep: DeepInner = DeepInner{};
}

struct Outer {
    mid: Middle = Middle{};
}

contract DeepChainDefaultTest {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}