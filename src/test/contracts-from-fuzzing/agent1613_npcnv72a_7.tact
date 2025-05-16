struct Leaf {
    val1: Bool;
    val2: String;
}

struct Branch1 {
    child: Leaf;
    opti: Bool?;
}

struct Branch2 {
    child: Leaf;
    data: String?;
}

struct Root {
    left: Branch1;
    right: Branch2;
}

contract TwoBranches {
    root: Root;

    init() {
        self.root = Root{
            left: Branch1{
                child: Leaf{val1:true,val2:"A"},
                opti:null
            },
            right: Branch2{
                child: Leaf{val1:false,val2:"B"},
                data:null
            }
        };
    }
}
