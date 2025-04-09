contract ParamStruct(
    a: Int,
    b: Int as uint8,
    c: Int?,
    d: Bool,
    e: String,
    f: Bool?,
    g: Int as uint64,
    h: String?,
) {
    receive() {
        // dummy to reference fields so compiler includes them
        dump(self.a + self.b);
    }
}
