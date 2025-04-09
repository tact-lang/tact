struct HasStrings {
    foo: String;
    bar: String;
    val: Int;
}

contract StructWithStrings {
    s: HasStrings;

    init() {
        self.s = HasStrings{
            foo: "Alpha",
            bar: "Beta",
            val: 42
        };
    }
}