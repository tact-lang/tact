struct Nested1 {
    x: Int;
}

struct Nested2 {
    n1: Nested1;
    y: Int?;
}

contract TestContract {
    data: Nested2;
    
    init() {
        self.data = Nested2{
            n1: Nested1{ x: 7 },
            y: null
        };
    }
}