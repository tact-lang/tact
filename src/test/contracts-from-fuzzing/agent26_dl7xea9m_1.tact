struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{a: 1, b: true};
    }
}