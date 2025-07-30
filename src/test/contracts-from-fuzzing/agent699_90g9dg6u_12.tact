struct Leaf { l: Int; }
struct Branch {
    left: Leaf; 
    right: Leaf; 
}
struct Root {
    first: Branch;
    second: Branch;
    label: String;
}

contract Tree {
    data: Root;

    init() {
        self.data = Root{
            first: Branch{
                left: Leaf{ l:1 },
                right: Leaf{ l:2 }
            },
            second: Branch{
                left: Leaf{ l:3 },
                right: Leaf{ l:4 }
            },
            label: "root"
        };
    }
}
