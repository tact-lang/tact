struct StringAndInt {
    s: String;
    x: Int;
}

contract NullableStructField {
    composite: StringAndInt?;

    init() {
        self.composite = StringAndInt{
            s: "hi",
            x: 42,
        };
    }
}
