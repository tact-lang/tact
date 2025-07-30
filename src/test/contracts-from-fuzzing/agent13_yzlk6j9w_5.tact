struct SmallOpt {
    a: Int?;
    b: Bool?;
}

struct LargeList {
    x1: SmallOpt; x2: SmallOpt; x3: SmallOpt; x4: SmallOpt; x5: SmallOpt;
    x6: SmallOpt; x7: SmallOpt; x8: SmallOpt; x9: SmallOpt; x10: SmallOpt;
}

contract ManyNestedOptionals {
    data: LargeList;

    init() {
        self.data = LargeList{
            x1: SmallOpt{ a:null, b:true },
            x2: SmallOpt{ a:2, b:null },
            x3: SmallOpt{ a:null, b:null },
            x4: SmallOpt{ a:4, b:true },
            x5: SmallOpt{ a:5, b:false },
            x6: SmallOpt{ a:null, b:true },
            x7: SmallOpt{ a:7, b:null },
            x8: SmallOpt{ a:null, b:null },
            x9: SmallOpt{ a:9, b:true },
            x10: SmallOpt{ a:10, b:false }
        };
    }
}