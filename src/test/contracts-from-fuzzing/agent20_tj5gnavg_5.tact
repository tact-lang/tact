struct NestedString {
    value: String;
}

struct Outer {
    nested: NestedString;
}

contract LongStringStruct {
    textData: Outer;

    init() {
        self.textData = Outer{ nested: NestedString{ value: "A very long string to test nested serialization behavior." } };
    }
}