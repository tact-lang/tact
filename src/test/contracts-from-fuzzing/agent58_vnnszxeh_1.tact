struct DeepNest1 { val: Int; }
struct DeepNest2 { inner: DeepNest1; }
struct DeepNest3 { inner: DeepNest2; }
contract NestedStore {
    nested: DeepNest3;
    init() {
        self.nested = DeepNest3{ inner: DeepNest2{ inner: DeepNest1{ val: 42 } } };
    }
}
