struct Leaf {
    count: Int = 5;
    txt: String = "hello";
}

struct Branch {
    leaf: Leaf = Leaf{};
    label: String = "default";
}

contract Test {
    data: Branch;

    init() {
        self.data = Branch{};
    }
}