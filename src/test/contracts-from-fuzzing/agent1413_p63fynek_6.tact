struct Leaf {
    val: Int = 999;
    flag: Bool = false;
}

struct Branch {
    s: String = "hi";
    leaf: Leaf?;
}

struct Root {
    addr: Address;
    branch: Branch;
}

contract DefaultNestTest {
    data: Root;

    init() {
        self.data = Root{
            addr: myAddress(),
            branch: Branch{
                s: "override",
                leaf: null,
            }
        };
    }

    receive() {}
}
