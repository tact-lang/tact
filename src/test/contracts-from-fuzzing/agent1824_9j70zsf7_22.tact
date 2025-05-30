// Explicitly nested optional *inside* optional (double optional disallowed!)
// So test two sibling optionals inside a struct, nested under a contract
struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract OptBranch {
    tree: Branch;

    init() {
        self.tree = Branch{ left: null, right: null };
    }
}
