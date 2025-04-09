struct StringsDemo {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract StringContract {
    s: StringsDemo;
    init() {
        self.s = StringsDemo{
            a: "one",
            b: "two",
            c: "three",
            d: "four"
        };
    }
}