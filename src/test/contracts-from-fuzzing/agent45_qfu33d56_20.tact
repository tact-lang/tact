struct Deeper1 { a:Int }
struct Deeper2 { b:Int; d1:Deeper1 }
struct Deeper3 { c:Int; d2:Deeper2 }

struct Tree {
    left: Deeper3;
    right: Deeper3;
}

contract TwoDeepTrees {
    data: Tree;

    init() {
        self.data = Tree{
            left: Deeper3{c:1,d2:Deeper2{b:2,d1:Deeper1{a:3}}},
            right: Deeper3{c:4,d2:Deeper2{b:5,d1:Deeper1{a:6}}}
        };
    }
}