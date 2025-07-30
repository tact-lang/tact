struct Leaf {
    val: Int? = null;
}

struct Middle {
    leaf: Leaf? = null;
}

struct Top {
    mid: Middle? = null;
}

contract NestedCompositeOptional {
    content: Top = Top{ mid: null };
}