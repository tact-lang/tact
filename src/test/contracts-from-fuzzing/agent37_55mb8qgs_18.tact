struct MultipleLayers {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    flag: Bool;
    val: Int;
    name: String;
}

contract NestedLayers {
    store: MultipleLayers;

    init() {
        self.store = MultipleLayers{
            inner1: Inner{ flag: true, val:123, name: "test" },
            inner2: Inner{ flag: false, val:456, name: "again" }
        };
    }
}
