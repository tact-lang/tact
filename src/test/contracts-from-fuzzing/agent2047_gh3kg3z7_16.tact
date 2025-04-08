struct Leaf2 {
    foo: Int;
    bar: Bool;
}

struct Branch2 {
    left: Leaf2?;
    right: Leaf2?;
}

contract DeepTreeOptionals {
    treeOpt: Branch2;

    init() {
        self.treeOpt = Branch2{
            left: null,
            right: null
        };
    }
}