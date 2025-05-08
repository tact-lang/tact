struct DeepInner {
    x: Int;
}

struct Middle {
    inner: DeepInner;
}

struct OuterMost {
    mid: Middle;
}

contract VeryNestedStructs {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid: Middle{
                inner: DeepInner{ x:7 }
            }
        };
    }
}