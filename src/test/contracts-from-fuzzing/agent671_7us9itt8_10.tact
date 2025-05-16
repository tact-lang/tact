struct Leaf {
    n: Int?;
}

struct Branch {
    leafOpt: Leaf?;
    flag: Bool;
}

contract TestContract {
    x: Branch;

    init() {
        self.x = Branch{
            leafOpt: null,
            flag: true
        };
    }
}