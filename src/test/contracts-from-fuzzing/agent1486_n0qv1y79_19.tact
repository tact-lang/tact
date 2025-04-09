struct Branch {
    deepLeaf: Leaf2?;
    sideVal: Bool;
}

struct Leaf2 {
    x: Int;
    y: Bool?;
}

struct Root {
    id: Int;
    child: Branch;
    flag: Bool?;
}

contract DeepWide {
    data: Root;

    init() {
        self.data = Root{
            id: 99,
            child: Branch{
                deepLeaf: Leaf2{
                    x: 77,
                    y: null
                },
                sideVal: false
            },
            flag: null
        };
    }
}