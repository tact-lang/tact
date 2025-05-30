struct StructWithLongString {
    s: String;
}

contract LongStringContract {
    d: StructWithLongString;

    init() {
        self.d = StructWithLongString{
            s: "This is a very long string to test persistence layer edge cases in Tact compiler, ensure proper encoding!"
        };
    }
}
