struct Leaf { val: Int?; }
struct Branch { leaf: Leaf; }

contract NestOptChain {
    data: Branch;
    init() {
        self.data = Branch{ leaf: Leaf{ val: null } };
    }
}