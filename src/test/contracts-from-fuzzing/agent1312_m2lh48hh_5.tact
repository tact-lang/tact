struct DeepNest1 { x: Int; }
struct DeepNest2 { f: DeepNest1; }
struct DeepNest3 { g: DeepNest2; }
struct DeepNest4 { h: DeepNest3; }

contract TestContract {
    data: DeepNest4;

    init() {
        self.data = DeepNest4{h: DeepNest3{g: DeepNest2{f: DeepNest1{x: 123}}}};
    }
}