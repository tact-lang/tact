struct NullableStringStruct {
    s: String?;
}

contract NullableStringTest {
    val: NullableStringStruct;

    init() {
        self.val = NullableStringStruct{
            s: null,
        };
    }
}