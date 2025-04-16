struct DeepNested {
    s1: L1;
}

struct L1 {
    s2: L2;
}

struct L2 {
    s3: L3;
}

struct L3 {
    value: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{ s1: L1{ s2: L2{ s3: L3{ value: 123 } } } };
    }
}