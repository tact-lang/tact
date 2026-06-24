struct NestedBoolDefaults {
    inner: BoolDefaultStruct;
}

struct BoolDefaultStruct {
    a: Bool = true;
    b: Bool?;
}

contract BoolNestedDefaultContract {
    storage: NestedBoolDefaults;

    init() {
        self.storage = NestedBoolDefaults{
            inner: BoolDefaultStruct{},
        };
    }
}