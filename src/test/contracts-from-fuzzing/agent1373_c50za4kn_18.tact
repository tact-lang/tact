struct Leaf { val: Int; }

struct Mid1 { leaf1: Leaf; }
struct Mid2 { leaf2: Leaf; }
struct Mid3 { mid1: Mid1; mid2: Mid2; }

struct Top { branch: Mid3; }

contract Test {
    tree: Top;

    init() {
        self.tree = Top{
            branch: Mid3{
                mid1: Mid1{ leaf1: Leaf{ val: 1 } },
                mid2: Mid2{ leaf2: Leaf{ val: 2 } }
            }
        };
    }
}