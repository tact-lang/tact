struct HasStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract Strs {
    s: HasStrings;
    init() {
        self.s = HasStrings{
            a: "a",
            b: null,
            c: "c",
            d: "d"
        };
    }
    receive() {
        let _ = self.s.c;
    }
}