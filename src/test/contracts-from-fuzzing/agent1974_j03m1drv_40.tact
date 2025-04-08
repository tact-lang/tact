struct InnerLeaf { a: Int; b: Bool; opt: Int?; }

struct MiddleBranch {
    one: InnerLeaf;
    two: InnerLeaf;
}

struct RootTree {
    upper: MiddleBranch;
    lower: MiddleBranch;
    marker: Bool;
}

contract TreeDeep {
    content: RootTree;

    init() {
        self.content = RootTree{
            upper: MiddleBranch{
                one: InnerLeaf{ a:1, b:true, opt:null },
                two: InnerLeaf{ a:2, b:false, opt:3 }
            },
            lower: MiddleBranch{
                one: InnerLeaf{ a:4, b:true, opt:null },
                two: InnerLeaf{ a:5, b:false, opt:6 }
            },
            marker: true
        };
    }
}
