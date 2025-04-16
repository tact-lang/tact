struct OptionalStruct {
    val: Int = 10;
    text: String = "abc";
}

contract NullablesTest {
    optionalField: OptionalStruct?;

    init() {
        self.optionalField = OptionalStruct{
            val: 123,
            text: "zzz"
        };
    }
}