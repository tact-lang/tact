struct Leaf {
    val: Int?;
    flag: Bool;
}

struct Branch {
    leaf: Leaf;
    txt: String?;
}

struct Root {
    br: Branch;
    ok: Bool;
}

contract DeepNonOptionalNest {
    data: Root;

    init() {
        self.data = Root{
            br: Branch{
                leaf: Leaf{
                    val: null,
                    flag: true
                },
                txt: null
            },
            ok: false
        };
    }

    receive() {}
}