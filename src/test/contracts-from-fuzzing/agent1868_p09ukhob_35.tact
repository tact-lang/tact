struct Nested {
    s: String;
    b: Bool;
}

contract ManyInitNested {
    field: Nested;
    
    init() {
        self.field = Nested{
            s: "hi",
            b: false
        };
    }
}