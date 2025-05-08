struct OptionalStringStruct {
    str1: String?;
    str2: String?;
}

contract OptionalStringsTest {
    texts: OptionalStringStruct;

    init() {
        self.texts = OptionalStringStruct{ str1: null, str2: null };
    }
}
