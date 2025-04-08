struct FewStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract ManyStrings {
    data: FewStrings;

    init() {
        self.data = FewStrings{
            a: "one",
            b: "two",
            c: "three",
            d: "four",
            e: "five"
        };
    }
}