struct Leaf {
    val: Int?;
}

struct OptionalMid {
    leaf: Leaf?;
    flag: Bool?;
}

struct Root {
    left: OptionalMid?;
    right: OptionalMid?;
}

contract TestContract {
    state: Root;

    init() {
        self.state = Root{
            left: OptionalMid{
                leaf: Leaf{
                    val: null
                },
                flag: true
            },
            right: null
        };
    }
}