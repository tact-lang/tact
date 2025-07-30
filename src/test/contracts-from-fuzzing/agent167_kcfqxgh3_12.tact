struct Leaf {
    val: Int;
}

struct Middle {
    child: Leaf;
    note: String;
}

struct Root {
    mid: Middle;
    count: Int;
}

contract MultiNested {
    root: Root;

    init() {
        self.root = Root{
            mid: Middle{
                child: Leaf{val: 100},
                note: "msg"
            },
            count: 5
        };
    }
}