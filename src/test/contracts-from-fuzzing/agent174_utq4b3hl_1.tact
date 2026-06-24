struct DeepNest2 { val: Int; }
struct DeepNest1 { d2: DeepNest2; }
struct Outer { dn: DeepNest1; }

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{ dn: DeepNest1{ d2: DeepNest2{ val: 100 } } };
    }
}