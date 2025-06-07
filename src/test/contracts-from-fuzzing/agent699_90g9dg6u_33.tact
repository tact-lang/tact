struct LeafInner { val:Int; }
struct InnerBranch { l:LeafInner; r:LeafInner; }
struct OuterBranch { b1:InnerBranch; b2:InnerBranch; }
struct RootTree { left:OuterBranch; right:OuterBranch; flag:Bool; }

contract TreeStruct {
    tree: RootTree;

    init() {
        self.tree = RootTree{
            left: OuterBranch{
                b1: InnerBranch{ l:LeafInner{val:1}, r:LeafInner{val:2}},
                b2: InnerBranch{ l:LeafInner{val:3}, r:LeafInner{val:4}}
            },
            right: OuterBranch{
                b1: InnerBranch{ l:LeafInner{val:5}, r:LeafInner{val:6}},
                b2: InnerBranch{ l:LeafInner{val:7}, r:LeafInner{val:8}}
            },
            flag: false
        };
    }
}