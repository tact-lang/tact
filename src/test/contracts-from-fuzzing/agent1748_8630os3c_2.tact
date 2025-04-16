struct DeepInner {
    value: Int?;
}

struct Middle {
    inner: DeepInner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
}

contract DeepTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: Middle{
                inner: DeepInner{ value: null },
                flag: true
            }
        };
    }
}