struct TwoStrings {
    first: String;
    second: String;
}

contract StructWithTwoStrings {
    s: TwoStrings;
    
    init() {
        self.s = TwoStrings { first: "hello", second: "world" };
    }
}