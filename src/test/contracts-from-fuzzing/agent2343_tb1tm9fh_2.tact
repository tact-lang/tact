struct DeepInner {
    x: Int;
    y: Bool?;
}

struct Middle {
    di: DeepInner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    val: Int?;
}

contract DeeplyNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                di: DeepInner{ x: 42, y: null },
                flag: true
            },
            val: null
        };
    }
}
