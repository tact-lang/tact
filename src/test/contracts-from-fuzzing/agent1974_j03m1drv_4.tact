struct Leaf {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    primary: Branch;
    secondary: Branch;
    flag: Bool;
}

contract DeepNest {
    data: Root;

    init() {
        self.data = Root{
            primary: Branch{
                left: Leaf{ a:1, b:null, c:true },
                right: Leaf{ a:2, b:3, c:false }
            },
            secondary: Branch{
                left: Leaf{ a:4, b:null, c:true },
                right: Leaf{ a:5, b:6, c:false }
            },
            flag: true
        };
    }
}
