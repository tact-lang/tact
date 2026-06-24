struct ManyStrings {
    a: String = "hello";
    b: String? = null;
    c: String;
    d: String?;
}

contract TestContract {
    s: ManyStrings;
    init() {
        self.s = ManyStrings{
            a: "world",
            b: "non-null",
            c: "abc",
            d: null
        };
    }
}