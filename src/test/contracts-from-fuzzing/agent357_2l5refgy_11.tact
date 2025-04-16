struct LotsOfStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
}

contract TestContract {
    texts: LotsOfStrings;
    
    init() {
        self.texts = LotsOfStrings{
            a: "a", b: "b", c: "c",
            d: "d", e: "e", f: "f"
        };
    }
}