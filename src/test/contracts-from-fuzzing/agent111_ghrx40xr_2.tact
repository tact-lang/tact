struct Nested {
    x: Int;
    y: Bool?;
    s: String;
}

contract DeepOptional {
    record: Nested?;
    
    init() {
        self.record = Nested{ x: 0, y: null, s: "" };
    }
}