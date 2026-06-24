struct WithStrings {
    a: String;
    b: String;
    c: Bool;
    d: String;
}

contract Str {
    s: WithStrings;

    init() {
        self.s = WithStrings{
            a:"abc",
            b:"def",
            c:true,
            d:"ghi",
        };
    }
}