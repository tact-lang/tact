struct Leaf {
    data1: Bool;
    data2: Int?;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
    flag: Bool;
}

struct Root {
    branch1: Branch;
    branch2: Branch?;
    marker: Int;
}

contract DeepTree {
    state: Root;

    init() {
        self.state = Root{
            branch1: Branch{
                left: Leaf{data1:true, data2:null},
                right: null,
                flag: true
            },
            branch2: null,
            marker: 99
        };
    }
}