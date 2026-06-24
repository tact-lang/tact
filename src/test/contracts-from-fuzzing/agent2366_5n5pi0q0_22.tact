struct StructWLongString {
    s: String;
}

contract LongStringTest {
    val: StructWLongString;

    init() {
        self.val = StructWLongString{s: "This is a very very very long string to test persistence edge case."};
    }
}