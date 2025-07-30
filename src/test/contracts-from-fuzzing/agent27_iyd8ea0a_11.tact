struct NullableString {
    val: String?;
}

contract NullableTest {
    data: NullableString;

    init() {
        self.data = NullableString{
            val: null
        };
    }
}