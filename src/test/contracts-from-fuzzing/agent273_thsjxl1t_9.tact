struct Strings {
    s1: String;
    s2: String;
}

contract Test9 {
    val: Strings;

    init() {
        self.val = Strings{
            s1: "alpha",
            s2: "beta"
        };
    }
}