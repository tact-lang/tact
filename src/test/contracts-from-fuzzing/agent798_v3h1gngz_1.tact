struct DeepNest1 { a: Int; }
struct DeepNest2 { b: DeepNest1; }
struct DeepNest3 { c: DeepNest2; }

contract Test {
    data: DeepNest3 = DeepNest3{ c: DeepNest2{ b: DeepNest1{ a: 42 } } };
    
    receive() {
        self.data = DeepNest3{ c: DeepNest2{ b: DeepNest1{ a: 1 } } };
    }
}