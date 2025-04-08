struct DeepNest1 { a: Int; }
struct DeepNest2 { b: DeepNest1; }
struct DeepNest3 { c: DeepNest2; }
struct DeepNest4 { d: DeepNest3; }

contract TestContract {
    val: DeepNest4;
    
    init() {
        self.val = DeepNest4{ d: DeepNest3{ c: DeepNest2{ b: DeepNest1{ a: 42 } } } };
    }
}