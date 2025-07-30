struct Leaf {
    a: Int;
    b: String;
}

struct Branch {
    l1: Leaf?;
    l2: Leaf?;
}

contract OptionalTree {
    br1: Branch?;
    br2: Branch?;

    init() {
        self.br1 = Branch{l1:null,l2:Leaf{a:1,b:"one"}};
        self.br2 = null;
    }
}