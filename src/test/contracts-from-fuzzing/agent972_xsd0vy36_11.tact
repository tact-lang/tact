struct InnerAOpt {
    q: String?;
}

struct InnerBOpt {
    r: Int?;
}

struct ParentStruct {
    a: InnerAOpt?;
    b: InnerBOpt?;
    flag: Bool;
}

contract TestParentOptStructs {
    storage: ParentStruct;

    init() {
        self.storage = ParentStruct{
            a: InnerAOpt{ q: null },
            b: null,
            flag: true,
        };
    }
}
