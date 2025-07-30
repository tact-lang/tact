// Intensively combinatorial optional nesting
struct Leaf {
    i: Int?;
    s: String?;
}

struct Mid {
    l1: Leaf?;
    l2: Leaf?;
    flag: Bool?
}

struct Top {
    m1: Mid?;
    m2: Mid?;
    text: String?;
}

contract DenseMultiLevel {
    val: Top?;

    init() {
        self.val = Top{
            m1: null,
            m2: Mid{
                l1: null,
                l2: null,
                flag: false
            },
            text: null
        };
    }
}