// Layered optional/defaults chain with no nested optionals violating the known issue
struct Leaf {
    val: Int?;
    flag: Bool = false;
}

struct Middle {
    leaf: Leaf?;
    str: String = "hi";
}

struct Root {
    mid: Middle?;
    b: Bool = true;
}

contract OptDefaultChain {
    data: Root;

    init() {
        self.data = Root{
            mid: Middle{
                leaf: Leaf{
                    val: 10,
                    flag: true
                },
                str: "zzz"
            },
            b: false
        };
    }
}