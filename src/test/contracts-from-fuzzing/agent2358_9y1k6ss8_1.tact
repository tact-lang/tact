struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    x: String;
    y: Nested1;
}

contract TestContract {
    data: Nested2;
    
    init() {
        self.data = Nested2{
            x: "hello",
            y: Nested1{ a: 1, b: true }
        };
    }
}