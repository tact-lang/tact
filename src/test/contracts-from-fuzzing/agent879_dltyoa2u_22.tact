struct MultiStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract MultiStringFields {
    s: MultiStrings;
    init() {
        self.s = MultiStrings{
            a:"A", b:"B", c:"C", d:"D", e:"E"
        };
    }
}
