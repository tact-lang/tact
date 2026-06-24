contract FieldsWithVariousDefaults {
    a: Int = 0;
    b: Bool = true;
    c: String = "default";
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;

    init() {
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
    }
}