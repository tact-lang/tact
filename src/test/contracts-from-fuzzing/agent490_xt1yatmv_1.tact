struct NestedStruct { inner: Int; }

struct OuterStruct { nested: NestedStruct; value: Int; }

contract TestContract {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            nested: NestedStruct{inner: 5},
            value: 7
        };
    }
}