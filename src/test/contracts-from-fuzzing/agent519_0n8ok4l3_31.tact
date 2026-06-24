struct LayerOne {
    val1: Int;
    val2: Bool;
}

struct LayerTwo {
    wrap: LayerOne;
    extra: String;
}

contract TwoLayerWrap {
    payload: LayerTwo;

    init() {
        self.payload = LayerTwo{
            wrap: LayerOne{ val1: 2, val2: true },
            extra: "extra"
        };
    }
}