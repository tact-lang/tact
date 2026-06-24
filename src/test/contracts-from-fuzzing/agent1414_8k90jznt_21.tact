struct InnerStruct { val: Int; }

struct OuterStruct { inner: InnerStruct?; }

contract DoubleOptionalStruct {
    outer: OuterStruct?;

    init() {
        self.outer = null;
    }
}