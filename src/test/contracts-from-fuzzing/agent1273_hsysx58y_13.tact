struct ManyStrings {
    a: String;
    b: String;
    c: String;
}

contract TestContract {
    s: ManyStrings;

    init() {
        self.s = ManyStrings{
            a: "one",
            b: "two",
            c: "three"
        };
    }
}