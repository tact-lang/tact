struct Leaf {
    value: Int;
}

struct Middle {
    leafOpt: Leaf?;
    number: Int;
}

struct Root {
    midOpt: Middle?;
    name: String;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            midOpt: Middle{
                leafOpt: Leaf{
                    value: 42
                },
                number: 7
            },
            name: "test"
        };
    }
}