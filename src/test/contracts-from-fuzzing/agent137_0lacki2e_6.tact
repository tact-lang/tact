struct LongStrings {
    a: String;
    b: String;
    c: String;
}

contract TestLongStrings {
    s: LongStrings;
    init() {
        self.s = LongStrings{
            a: "a very very very very very very very very very very very very very very long string",
            b: "another very very very very very very very very very very very very long string",
            c: "yet another extremely extremely extremely extremely long string",
        };
    }
}