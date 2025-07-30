struct DeepNested {
    l2: L2;
}

struct L2 {
    l3: L3;
}

struct L3 {
    l4: L4;
}

struct L4 {
    a: Int?;
    b: Bool;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{ l2: L2{ l3: L3{ l4: L4{ a: null, b: true } } } };
    }
}