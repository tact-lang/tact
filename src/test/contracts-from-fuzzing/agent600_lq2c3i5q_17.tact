// Deep nesting with optionals at multiple levels
struct Leaf { v: Int; }
struct BranchOpt { leaf: Leaf?; }
struct MiddleOpt { branch: BranchOpt?; }
struct RootOpt { middle: MiddleOpt?; }

contract DeepOptionals {
    root: RootOpt;
    init() {
        self.root = RootOpt{ middle: null };
    }
}