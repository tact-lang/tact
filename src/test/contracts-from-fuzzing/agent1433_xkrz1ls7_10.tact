struct DeepNested1 {
    x: Int;
}

struct DeepNested2 {
    inner: DeepNested1;
}

struct DeepNested3 {
    inner: DeepNested2;
}

struct DeepNested4 {
    inner: DeepNested3;
}

contract TestContract {
    nested: DeepNested4;
    init() {
        self.nested = DeepNested4{
            inner: DeepNested3{
                inner: DeepNested2{
                    inner: DeepNested1{ x: 555 }
                }
            }
        };
    }
}