// Exploration: deeply nested optional struct fields, with partial explicit init
struct Leaf {
    count:Int?;
    text:String?;
}

struct Branch {
    leaf:Leaf?;
}

struct Root {
    branch:Branch?;
    label:String;
}

contract PartialExplicit {
    r:Root;

    init() {
        self.r = Root{
            branch: Branch{leaf:null},
            label: "done"
        };
    }
}