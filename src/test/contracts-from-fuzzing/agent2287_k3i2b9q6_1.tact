struct DeepNested {
    inner: Middle;
}

struct Middle {
    leaf: Leaf;
}

struct Leaf {
    val: Int;
}

contract DeepStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{ inner: Middle{ leaf: Leaf{ val: 123 } } };
    }
}