struct Nested {
    optInt: Int?;
    text: String;
}

contract OptionalStructContract {
    s: Nested?;
    
    init() {
        self.s = Nested{ optInt: null, text: "hi" };
    }
}