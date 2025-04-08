struct InnerStruct {
    val: Int;
}

struct MegaStruct {
    id: Int;
    flag: Bool;
    nested: InnerStruct;
    maybeCell: Cell?;
    maybeNested: InnerStruct?;
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeAddr: Address?;
}

contract MegaPersistent {
    s: MegaStruct;

    init() {
        self.s = MegaStruct {
            id: 0,
            flag: false,
            nested: InnerStruct{ val: 1 },
            maybeCell: null,
            maybeNested: null,
            maybeInt: null,
            maybeBool: null,
            maybeAddr: null
        };
    }
}