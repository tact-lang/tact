struct DeepNest1 { f: Int; }
struct DeepNest2 { d: DeepNest1; }
struct DeepNest3 { d: DeepNest2; }
struct DeepNest4 { d: DeepNest3; }
struct DeepNest5 { d: DeepNest4; }

contract TestContract {
    deep: DeepNest5;

    init() {
        self.deep = DeepNest5{ d: DeepNest4{ d: DeepNest3{ d: DeepNest2{ d: DeepNest1{ f: 7 }}}}};
    }
}