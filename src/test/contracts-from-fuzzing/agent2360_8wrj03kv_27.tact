// Contract with a deeply nested optional in optional inside field
struct Leaf { val: Int; }

struct Mid { leaf: Leaf?; }

struct Root { mid: Mid?; }

contract NestedDeepOpt {
    d: Root;
    init() {
        self.d = Root { mid: null };
    }
}