struct Leaf {
    val: Int = 7;
}

struct Middle {
    leaf: Leaf; // has default inside
}

struct Top {
    m: Middle; // no explicit default for m
}

contract PartialDeep {
    t: Top = Top{ m: Middle{ leaf: Leaf{} } }; // rely on Leaf default

    init() {
        // no assignment needed
    }
}
