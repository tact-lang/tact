struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    s: Nested;
    
    init() {
        self.s = Nested{x: 1, y: true, z: "test"};
    }
}