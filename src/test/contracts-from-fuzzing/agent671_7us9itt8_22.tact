struct Leaf1 { a: Int; }
struct Leaf2 { b: Bool; }

struct Middle {
    one: Leaf1?;
    two: Leaf2?;
    flag: Bool;
}

contract TestContract {
    storage: Middle;

    init() {
        self.storage = Middle{
            one: null,
            two: null,
            flag: true
        };
    }
}