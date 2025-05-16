struct Nested2 {
    b: Bool;
}

struct Nested1 {
    n2: Nested2;
}

struct Outer {
    n1: Nested1;
}

contract DeepNestedStructStorage {
    data: Outer;
    
    init() {
        self.data = Outer{
            n1: Nested1{
                n2: Nested2{b: true}
            }
        };
    }
}