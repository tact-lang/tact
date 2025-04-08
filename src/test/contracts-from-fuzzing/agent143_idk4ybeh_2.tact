struct DeepNested3 { x: Int; y: Bool; }
struct DeepNested2 { inner: DeepNested3; }
struct DeepNested1 { inner: DeepNested2; }

contract DeepNestHolder {
    nested: DeepNested1;
    init() {
        self.nested = DeepNested1{
            inner: DeepNested2{
                inner: DeepNested3{ x: 5, y: false }
            }
        };
    }
}