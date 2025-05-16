struct BoolNest {
    flag: Bool;
    optFlag: Bool?;
}

struct Layer {
    inner: BoolNest;
    optInner: BoolNest?;
}

contract BoolNested {
    data: Layer;

    init() {
        self.data = Layer{
            inner: BoolNest{ flag: true, optFlag: null },
            optInner: null
        };
    }
}