struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

struct MidStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

struct OuterStruct {
    mid1: MidStruct;
    mid2: MidStruct;
}

contract MultiNested {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            mid1: MidStruct{
                inner1: InnerStruct{x: 1, y: true, z: "A"},
                inner2: InnerStruct{x: 2, y: false, z: "B"},
            },
            mid2: MidStruct{
                inner1: InnerStruct{x: 3, y: true, z: "C"},
                inner2: InnerStruct{x: 4, y: false, z: "D"},
            },
        };
    }
}
