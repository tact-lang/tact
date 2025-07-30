struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract MultiStringContract {
    data: ManyStrings;

    init() {
        self.data = ManyStrings{
            a: "one",
            b: "two",
            c: "three",
            d: "four"
        };
    }

    receive() {
        self.data = ManyStrings{
            a: "1",
            b: "2",
            c: "3",
            d: "4"
        };
    }
}