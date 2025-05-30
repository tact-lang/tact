struct OptStr {
    s: String?;
}

contract OptStrFields {
    str1: OptStr;
    str2: OptStr;

    init() {
        self.str1 = OptStr{ s: null };
        self.str2 = OptStr{ s: "not null" };
    }
}