struct Leaf {
    a: Int as uint8;
    b: Int as int64;
}

struct Branch {
    leaf: Leaf?;
    description: String;
    flag: Bool;
}

contract TestContract {
    data: Branch;

    init() {
        self.data = Branch{
            leaf: Leaf{a: 100, b: -5000},
            description: "serialized",
            flag: true
        };
    }
}
