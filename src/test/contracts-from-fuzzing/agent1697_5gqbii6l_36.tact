struct Leaf {
    a: Int?;
    b: Bool? = null;
}

struct Mid {
    s: Leaf?;
    x: String?;
}

struct Root {
    m: Mid?;
    c: Cell?;
    q: Int = 7;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            m: Mid{
                s: Leaf{
                    a: null
                },
                x: null
            },
            c: null
        };
    }
}