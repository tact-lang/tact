struct Leaf {
    val: Int = 55;
}

struct Branch {
    leaf: Leaf? = Leaf{};
}

contract OptWithNonNullDef {
    data: Branch = Branch{};
}