struct HasOptionalStruct {
    nested: Inner?;
}

struct Inner {
    val: Int;
    txt: String;
}

contract OptionalStructNested {
    store: HasOptionalStruct;

    init() {
        self.store = HasOptionalStruct{ nested: null };
    }
}