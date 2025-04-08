struct SOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructOptionalField {
    so: SOptional?;

    init() {
        self.so = null;
    }
}