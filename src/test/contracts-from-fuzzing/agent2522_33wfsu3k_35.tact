struct MultipleStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract TestContract {
    ms: MultipleStrings;

    init() {
        self.ms = MultipleStrings {
            a: "one",
            b: "two",
            c: "three",
            d: "four",
            e: "five"
        };
    }
}