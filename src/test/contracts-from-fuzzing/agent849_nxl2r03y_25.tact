struct Texts {
    a: String;
    b: String;
    c: String;
    d: String;
}

contract TestContract {
    storage: Texts;

    init() {
        self.storage = Texts{
            a: "one",
            b: "two",
            c: "three",
            d: "four"
        };
    }
}