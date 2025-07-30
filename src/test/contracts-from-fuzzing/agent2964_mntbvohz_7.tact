struct StructWithStrings {
    first: String;
    second: String;
    third: String;
}

contract MultipleStrings {
    s: StructWithStrings;

    init() {
        self.s = StructWithStrings{
            first: "one",
            second: "two",
            third: "three"
        };
    }
}