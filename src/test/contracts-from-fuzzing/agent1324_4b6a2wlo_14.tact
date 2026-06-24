struct StructWithManyStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
    e: String;
}

contract ManyStrings {
    val: StructWithManyStrings;
    init() {
        self.val = StructWithManyStrings{
            a: "a",
            b: null,
            c: "c",
            d: "d",
            e: "e"
        };
    }
}