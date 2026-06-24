struct DeepOpt {
    val: Int?;
}

struct L2 {
    deepOpt: DeepOpt?;
}

contract NestedOptionals {
    l2: L2?;

    init() {
        self.l2 = L2{ deepOpt: DeepOpt{ val: 123 } };
    }
}