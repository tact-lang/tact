struct Leaf { val: Int; }
struct Branch {
    a: Leaf;
    b: Leaf?;
}

contract Mixed {
    tree: Branch = Branch{ a: Leaf{val: 1} };
}
