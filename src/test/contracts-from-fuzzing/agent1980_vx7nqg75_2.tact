struct DeepInner {
    z: Int?;
}

struct Middle {
    inner: DeepInner;
    val: Bool?;
}

struct Outer {
    middle: Middle;
    count: Int;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{ inner: DeepInner{z: null}, val: true },
            count: 5
        };
    }
}