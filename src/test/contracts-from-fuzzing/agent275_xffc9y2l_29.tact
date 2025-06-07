struct VariantFormats {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
}

contract SerializationSizes {
    val: VariantFormats;

    init() {
        self.val = VariantFormats{ a:1, b:2, c:3, d:4 };
    }
}