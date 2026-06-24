struct Variant {
    tag: Int;
    intval: Int?;
    strval: String?;
    boolval: Bool?;
}

contract VariantStore {
    data: Variant;

    init() {
        self.data = Variant{
            tag: 1,
            intval: 42,
            strval: null,
            boolval: null
        };
    }
}