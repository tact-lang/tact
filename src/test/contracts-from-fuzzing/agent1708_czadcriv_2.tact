struct NestedWithOptionals {
    nested: Inner?;
}

struct Inner {
    intField: Int;
    boolField: Bool?;
    addressField: Address;
}

contract TestContract {
    field: NestedWithOptionals;

    init() {
        self.field = NestedWithOptionals{
            nested: Inner{
                intField: 10,
                boolField: null,
                addressField: myAddress()
            }
        };
    }
}