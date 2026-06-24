struct DeepNested1 { val: Int; }
struct DeepNested2 { inner: DeepNested1; }

contract TestContract {
    nested: DeepNested2;
    
    init() {
        self.nested = DeepNested2{ inner: DeepNested1{ val: 42 } };
    }
}
