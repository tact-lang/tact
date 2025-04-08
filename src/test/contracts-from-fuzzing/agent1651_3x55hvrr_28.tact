struct DeepDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

struct Container {
    nested: DeepDefault;
}

contract Test28 {
    val: Container;

    init() {
        self.val = Container { nested: DeepDefault{} };
    }
}
