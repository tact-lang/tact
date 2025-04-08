struct Deeper {
    flag: Bool;
    comment: String;
}

struct Mid {
    a: Int;
    inner: Deeper;
    optional: String?;
}

struct Top {
    mid1: Mid;
    mid2: Mid;
}

contract NestingLevels {
    storage: Top;

    init() {
        self.storage = Top{
            mid1: Mid{ a:1, inner:Deeper{ flag:true, comment:"x" }, optional:null },
            mid2: Mid{ a:2, inner:Deeper{ flag:false, comment:"y" }, optional:"hello" },
        };
    }
}
