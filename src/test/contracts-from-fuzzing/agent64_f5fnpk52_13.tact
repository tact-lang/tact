struct NestedStr {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract NestedStrings {
    s: NestedStr;

    init() {
        self.s = NestedStr{
            a: "a",
            b: "b",
            c: "c",
            d: "d",
            e: "e"
        };
    }

    receive() {
        self.s.a = "z";
    }
}