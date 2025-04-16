struct Strs {
    s1: String;
    s2: String;
}

contract TwoStrings {
    val: Strs;

    init() {
        self.val = Strs{
            s1: "one",
            s2: "two"
        };
    }
}