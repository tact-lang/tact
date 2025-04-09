struct StrFields {
    f1: String;
    f2: String;
    f3: String;
    f4: String;
    f5: String;
}

contract TestContract {
    s: StrFields;
    init() {
        self.s = StrFields{
            f1: "one",
            f2: "two",
            f3: "three",
            f4: "four",
            f5: "five"
        };
    }
}