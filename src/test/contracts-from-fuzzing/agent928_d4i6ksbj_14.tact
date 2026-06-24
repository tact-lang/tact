struct OuterS {
    vInt: Int;
    optStr: String?;
}

struct UseOuter {
    nested: OuterS;
    flag: Bool;
}

contract StructInStruct {
    data: UseOuter;

    init() {
        self.data = UseOuter{
            nested: OuterS{vInt: 7, optStr: null},
            flag: true,
        };
    }
}