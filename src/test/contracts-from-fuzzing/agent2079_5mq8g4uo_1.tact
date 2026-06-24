struct Nested1 {
    a: Int;
}

struct Nested2 {
    b: Nested1;
}

contract TestContract {
    val: Nested2;
    
    init() {
        self.val = Nested2{b: Nested1{a: 42}};
    }
}