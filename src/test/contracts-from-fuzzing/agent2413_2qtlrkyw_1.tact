struct Nested {
    inner1: Int?;
    inner2: String;
}

contract TestContract {
    nestedField: Nested;
    
    init() {
        self.nestedField = Nested{
            inner1: null,
            inner2: "hello"
        };
    }
}