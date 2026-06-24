struct DeepNest3 {
    val: Int;
}

struct DeepNest2 {
    inner: DeepNest3;
}

struct DeepNest1 {
    inner: DeepNest2;
}

contract DeepChain {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{ inner: DeepNest2{ inner: DeepNest3{ val: 99 } } };
    }
}
