struct DeepNest2 {
    x: Int;
}

struct DeepNest1 {
    inner: DeepNest2;
}

contract DeepNestContract {
    value: DeepNest1 = DeepNest1{inner: DeepNest2{x: 123}};
    result: Int = 0;

    init() {
        self.result = self.value.inner.x;
    }
}
