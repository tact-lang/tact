struct DeepNest1 {
    f1: Int;
}

struct DeepNest2 {
    inner: DeepNest1;
}

struct DeepNest3 {
    inner: DeepNest2;
}

contract Test {
    deep: DeepNest3;

    init() {
        self.deep = DeepNest3{ inner: DeepNest2{ inner: DeepNest1{ f1: 7 } } };
    }
}