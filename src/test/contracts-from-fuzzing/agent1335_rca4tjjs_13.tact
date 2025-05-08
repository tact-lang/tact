struct Leaf {
    x: Int?;
    y: String? = "hi";
}

struct Branch {
    leaf: Leaf = Leaf{};
    flag: Bool = true;
}

contract MixedDefaultsFixed {
    data: Branch;
    init() {
        self.data = Branch{}; // now valid?
    }
    receive() {}
}