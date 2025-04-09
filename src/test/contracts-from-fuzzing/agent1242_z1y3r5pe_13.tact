struct Leaf { val: Int }
struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract Test {
    root: Branch;

    init() {
        self.root = Branch{
            left: Leaf{ val: 1 },
            right: null,
        };
    }
}
