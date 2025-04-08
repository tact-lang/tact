struct Layer2 {
    inner: Int?;
}

struct Layer1 {
    innerLayer: Layer2?;
}

contract NestedOptionalLayer {
    l: Layer1?;

    init() {
        self.l = null;
    }
}