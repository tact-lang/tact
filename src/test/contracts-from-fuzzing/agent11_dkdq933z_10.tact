// Test a struct with 1 deeply nested map with nested struct as value

struct Leaf {
    flag: Bool;
}

struct Branch {
    nodes: map<Int, Leaf>;
}

struct Root {
    sub: Branch;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            sub: Branch{
                nodes: emptyMap(),
            }
        };
    }
}