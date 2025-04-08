trait NestedTrait {
    inner: InnerTraitData;
}

struct InnerTraitData {
    a: Int;
    b: Bool;
}

contract NestedTraitImpl with NestedTrait {
    inner: InnerTraitData;

    init() {
        self.inner = InnerTraitData{
            a: 900,
            b: false,
        };
    }
}
