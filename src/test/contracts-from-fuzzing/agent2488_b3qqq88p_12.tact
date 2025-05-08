struct Leaf {
    k: Int;
}

struct Middle {
    leaf: Leaf?;
}

contract ComplexOptional {
    persist: Middle?;

    init() {
        self.persist = Middle{
            leaf: null
        };
    }
}