struct OptionalNested {
    inner: Int?;
}

struct HasOptStruct {
    maybe: OptionalNested?;
}

contract NestedOptFields {
    myfield: HasOptStruct;

    init() {
        self.myfield = HasOptStruct{ maybe: null };
    }
}