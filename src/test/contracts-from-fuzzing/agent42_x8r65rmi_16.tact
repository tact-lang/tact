struct DeepNest1 { f: Int; }
struct DeepNest2 { prev: DeepNest1; }
struct DeepNest3 { prev: DeepNest2; }
struct DeepNest4 { prev: DeepNest3; }
struct DeepNest5 { prev: DeepNest4; }
struct DeepNest6 { prev: DeepNest5; }
contract TestContract {
    x: DeepNest6;
    init() {
        self.x = DeepNest6{ prev: DeepNest5{ prev: DeepNest4{ prev: DeepNest3{ prev: DeepNest2{ prev: DeepNest1{ f: 123 }}}}}};
    }
}