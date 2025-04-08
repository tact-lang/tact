struct DeepNest1 {
    a: Int;
}

struct DeepNest2 {
    b: DeepNest1;
}

struct DeepNest3 {
    c: DeepNest2;
}

contract TestContract {
    deep: DeepNest3;

    init() {
        self.deep = DeepNest3{ c: DeepNest2{ b: DeepNest1{ a: 123 } } };
    }
}