struct NestedInner {
    innerVal: Int = 42;
    optionalInner: Bool?;
}

struct NestedOuter {
    outerVal: Int = 7;
    nestedInner: NestedInner;
    optionalOuter: String?;
}

contract DeepNestedTest {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            nestedInner: NestedInner{
                optionalInner: true
            },
            optionalOuter: "hi"
        };
    }
}