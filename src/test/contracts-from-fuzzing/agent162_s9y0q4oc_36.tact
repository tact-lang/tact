struct StringOnly {
    a: String;
    b: String;
    c: String;
}

contract TestContract {
    data: StringOnly;

    init() {
        self.data = StringOnly{
            a: "one",
            b: "two",
            c: "three"
        };
    }
}