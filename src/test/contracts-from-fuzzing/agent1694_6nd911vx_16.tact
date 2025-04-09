struct Leaf { value: Int?; }
struct Branch { leaf: Leaf?; }

contract MultiOpt {
    branch: Branch;

    init() {
        self.branch = Branch { leaf: null };
    }
}