struct Leaf {
    count: Int?;
    flag: Bool?;
}

struct Wrap {
    leaf: Leaf?;
    label: String;
}

contract TestContract {
    data: Wrap?;

    init() {
        self.data = null;
    }
}