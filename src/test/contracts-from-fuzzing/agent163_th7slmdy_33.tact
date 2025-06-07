struct Leaf {
    val: Int;
}

struct Branch {
    child: Leaf;
    b: Bool;
}

struct Root {
    b1: Branch;
    b2: Branch;
}

contract TreeStruct {
    r: Root;
    init() {
        self.r = Root{
            b1: Branch{ child: Leaf{val:1}, b:true },
            b2: Branch{ child: Leaf{val:2}, b:false },
        };
    }
}