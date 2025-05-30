struct DeepNest3 {
    x: Int;
}

struct DeepNest2 {
    d3: DeepNest3;
}

struct DeepNest1 {
    d2: DeepNest2;
}

contract DeepNestedContract {
    inner: DeepNest1;

    init() {
        self.inner = DeepNest1{
            d2: DeepNest2{
                d3: DeepNest3{ x: 42 }
            }
        };
    }
}