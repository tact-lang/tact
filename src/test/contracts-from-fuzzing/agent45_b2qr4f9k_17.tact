struct TextEdge {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract EdgeStrings {
    x: TextEdge;
    init() {
        self.x = TextEdge{
            a:"one", b:null, c:"three", d:"four"
        };
    }
}