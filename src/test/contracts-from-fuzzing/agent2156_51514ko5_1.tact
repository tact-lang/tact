struct DeepInner {
    a: Int;
    b: Bool?;
}

struct NestedOptional {
    inner: DeepInner?;
    z: String?;
}

contract TestContract {
    data: NestedOptional;
    
    init() {
        self.data = NestedOptional{
            inner: null,
            z: null
        };
    }
}