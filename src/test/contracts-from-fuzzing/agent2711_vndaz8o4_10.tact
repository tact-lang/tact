struct HasLongString {
    val: String;
}

contract LongStringStruct {
    s: HasLongString;

    init() {
        self.s = HasLongString{
            val: "ThisIsAVeryLongStringToTestPotentialSerializationLimitationsX",
        };
    }
}