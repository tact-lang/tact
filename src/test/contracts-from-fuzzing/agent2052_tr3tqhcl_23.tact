struct InnerLayer {
    flag: Bool;
}

struct MiddleLayer {
    val: Int;
    deep: InnerLayer;
}

struct OuterLayer {
    text: String;
    maybe: MiddleLayer?;
}

contract OptionalMiddleLayerTest {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            text: "hi",
            maybe: MiddleLayer{
                val: 99,
                deep: InnerLayer{ flag: false }
            }
        };
    }
}