struct NestedOptionals {
    a: Int?;
    b: Bool?;
}

struct OuterOptionals {
    inner: NestedOptionals?;
}

contract MultiLayerOptionals {
    data: OuterOptionals;

    init() {
        self.data = OuterOptionals{inner: null};
    }
}