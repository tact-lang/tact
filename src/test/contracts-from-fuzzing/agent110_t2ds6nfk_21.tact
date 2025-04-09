struct OptionalGroup {
    s: String?;
    i: Int?;
    b: Bool?;
}

struct TopLevel {
    g1: OptionalGroup;
    g2: OptionalGroup;
}

contract OptDeep {
    val: TopLevel;
    init() {
        self.val = TopLevel{
            g1: OptionalGroup{s:null,i:null,b:null},
            g2: OptionalGroup{s:null,i:null,b:null}
        };
    }
}