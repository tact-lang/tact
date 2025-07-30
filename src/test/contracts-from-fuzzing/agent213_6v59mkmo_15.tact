struct NestedA {
    x: Int; 
    y: Int?;
}

struct NestedB {
    a: NestedA?;
    b: Bool;
}

contract MyContract {
    state: NestedB;

    init() {
        self.state = NestedB{ a: null, b: true };
    }
}