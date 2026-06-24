struct InnerMost {
    leaf: String;
}

struct InnerMiddle {
    leaf: InnerMost;
}

struct Inner {
    branch: InnerMiddle;
}

struct Root {
    trunk: Inner;
}

contract Fuzz {
    root: Root;

    init() {
        self.root = Root{
            trunk: Inner{
                branch: InnerMiddle{
                    leaf: InnerMost{
                        leaf: "leaf-value",
                    },
                },
            },
        };
    }
}
