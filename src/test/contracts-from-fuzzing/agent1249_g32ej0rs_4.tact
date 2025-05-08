struct Leaf {
    one: Int?;
    two: Bool?;
}

struct Middle {
    leaf: Leaf?;
    text: String;
}

struct Root {
    middle: Middle?;
    addr: Address?;
}

contract TestContract {
    state: Root;

    init() {
        self.state = Root{
            middle: Middle{
                leaf: Leaf{
                    one: 77,
                    two: null,
                },
                text: "hello",
            },
            addr: null,
        };
    }
}