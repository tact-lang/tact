struct InnerLayer {
    x: Int;
    label: String;
}

struct MiddleLayer {
    inner: InnerLayer;
    flag: Bool;
}

struct OuterLayer {
    middle: MiddleLayer;
    note: String;
}

contract NestedLayerContract {
    layered: OuterLayer;

    init() {
        self.layered = OuterLayer {
            middle: MiddleLayer {
                inner: InnerLayer{x: 9, label: "innermost"},
                flag: true
            },
            note: "outermost"
        };
    }
}
