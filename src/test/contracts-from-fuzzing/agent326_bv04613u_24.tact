struct MultiLayer {
    a: Int;
    b: InnerWrap;
}

struct InnerWrap {
    x: Int;
    y: DeepInner;
}

struct DeepInner {
    z: String?;
}

contract MultiLayered {
    val: MultiLayer;

    init() {
        self.val = MultiLayer{
            a: 5,
            b: InnerWrap{
                x: 10,
                y: DeepInner{ z: null }
            }
        };
    }
}
