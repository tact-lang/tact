struct Leaf {
    lv: Int = 7;
}

struct Middle {
    mv: Leaf;
}

struct Root {
    rv: Middle;
}

contract DeepNestedField {
    root: Root = Root{ rv: Middle{ mv: Leaf{} } };
}