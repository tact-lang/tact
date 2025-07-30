struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract TestContract {
    item: OptionalNested;

    init() {
        self.item = OptionalNested{
            inner: InnerStruct{ value: null },
        };
    }

    receive() {
        let _ = self.item.inner;
        if (self.item.inner != null) {
            let innerVal = self.item.inner!!;
            let _ = innerVal.value;
        }
    }
}