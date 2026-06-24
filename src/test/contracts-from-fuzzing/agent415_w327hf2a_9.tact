struct Meta {
    description: String?;
    imageUrl: String?;
}

contract OptionalNestedStruct {
    meta: Meta?;

    init() {
        self.meta = null;
    }
}