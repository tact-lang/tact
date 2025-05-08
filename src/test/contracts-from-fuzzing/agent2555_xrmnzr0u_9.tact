struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct BigStruct {
    mainBranch: Branch?;
    auxBranch: Branch?;
    flag: Bool = true;
}

contract ComplexOpts {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            mainBranch: Branch{
                left: Leaf{ val: 10 },
                right: null
            },
            auxBranch: null,
            flag: false
        };
    }
}