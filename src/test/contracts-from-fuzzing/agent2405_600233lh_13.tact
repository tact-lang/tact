struct MultipleStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract MultiStringContract {
    data: MultipleStrings;

    init() {
        self.data = MultipleStrings{
            a: "one",
            b: "two",
            c: "three",
            d: "four"
        };
    }
}