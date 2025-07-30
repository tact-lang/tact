struct Leaf {
    x: Int? = null;
    y: Bool = true;
}

struct Branch {
    child: Leaf = Leaf{};
    label: String = "hi";
    opt: Int?;
}

struct Root {
    branch: Branch = Branch{};
    num: Int = 0;
}

contract DefaultedNested {
    data: Root;

    init() {
        self.data = Root{
            branch: Branch{
                child: Leaf{
                    x: 99,
                    y: false,
                },
                label: "branch",
                opt: null,
            },
            num: 42,
        };
    }

    receive() {}
}