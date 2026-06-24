struct Leaf {
    k: Int = 5;
}

struct Mid {
    leaf: Leaf?;
    msg: String = "test";
}

struct Root {
    mid: Mid?;
    id: Int = 0;
}

contract TestContract {
    data: Root = Root{
        mid: null,
        id: -1
    };

    init() {
        self.data = Root{
            mid: Mid{
                leaf: Leaf{
                    k: 123,
                },
                msg: "updated",
            },
            id: 42
        };
    }
}
