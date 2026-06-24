// Compose optionals and deeply nested structs overriding inline null defaults partially
struct Leaf {
    a: Int? = null;
    b: String? = null;
}

struct Middle {
    l: Leaf? = null;
}

struct Top {
    m: Middle? = null;
}

contract OverrideSome {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                l: null
            }
        };
    }
}