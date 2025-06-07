struct Leaf {
    val: Int?;
    name: String?;
}

struct Mid {
    leaf: Leaf?;
    flag: Bool;
}

struct Root {
    mid: Mid;
    count: Int;
}

contract ComplexNest {
    data: Root;

    init() {
        self.data = Root{
            mid: Mid{
                leaf: null,
                flag: true
            },
            count: 123
        };
    }
}