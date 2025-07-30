struct NestedStrings {
    first: String = "first";
    second: String = "second";
    third: String;
}

contract Test {
    s: NestedStrings = NestedStrings{ third: "third" };
    
    init() {
        self.s = NestedStrings{
            first: "1",
            second: "2",
            third: "3"
        };
    }
}