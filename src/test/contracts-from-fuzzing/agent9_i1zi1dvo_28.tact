contract OptionalSerializeTest {
    value1: Int? as uint32;
    value2: Int? as int64;

    init() {
        self.value1 = null;
        self.value2 = null;
    }
}