struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Nested;
    text: String;
}

contract TestContract {
    value: Outer;
    
    init() {
        self.value = Outer{inner: Nested{x: 5, y: true}, text: "hello"};
    }
}