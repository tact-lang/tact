struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    value: Nested;
    
    init() {
        self.value = Nested{
            a: 1,
            b: true,
            c: "test"
        };
    }
}