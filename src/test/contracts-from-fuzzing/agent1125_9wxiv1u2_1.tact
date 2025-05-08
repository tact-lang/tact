struct DeepNest1 { x: Int; }
struct DeepNest2 { d1: DeepNest1; }
struct DeepNest3 { d2: DeepNest2; }

contract TestContract {
    data: DeepNest3;
    init() {
        self.data = DeepNest3{ d2: DeepNest2{ d1: DeepNest1{ x: 5 } } };
    }
}