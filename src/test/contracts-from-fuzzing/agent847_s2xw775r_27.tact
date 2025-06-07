contract SerializeOptions {
    a: Int? as uint32;
    b: Address?;

    init() {
        self.a = null;
        self.b = null;
    }
}