// deeply nested optional struct non-null leaf
struct Leaf {
    x: Int;
}

struct Branch1 {
    leaf: Leaf?;
}

struct Branch2 {
    branch1: Branch1?;
}

contract DeepOptionalTree {
    top: Branch2;

    init() {
        self.top = Branch2{
            branch1: Branch1{
                leaf: Leaf{ x:42 }
            }
        };
    }
}