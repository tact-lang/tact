struct DeepNested {
    d1: Int;
    d2: Int?;
}

struct Nested {
    n1: Int;
    n2: DeepNested;
}

contract ComplexContract {
    val1: Int = 1;
    val2: Bool = true;
    opt1: String?; // default null
    nested: Nested = Nested{ n1: 2, n2: DeepNested{ d1: 3, d2: 4 } };

    init() {
        self.opt1 = "hello";
    }
}
