struct DeepInner {
    v: Int;
}

struct Middle {
    inner: DeepInner;
    opt: Bool?;
}

struct Outer {
    mid: Middle;
    val: Int;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: DeepInner{v: 10},
                opt: null
            },
            val: 20
        };
    }
}
