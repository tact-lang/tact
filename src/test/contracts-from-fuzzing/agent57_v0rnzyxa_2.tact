struct DeepNest3 { v: Int; }
struct DeepNest2 { d3: DeepNest3; }
struct DeepNest1 { d2: DeepNest2; }
struct RootNest { d1: DeepNest1; }

contract DeepNested {
    root: RootNest;

    init() {
        self.root = RootNest{ d1: DeepNest1{ d2: DeepNest2{ d3: DeepNest3{ v: 42 } } } };
    }
}