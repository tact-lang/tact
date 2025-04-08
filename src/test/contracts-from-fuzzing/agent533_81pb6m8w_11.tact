struct MultiLevelStruct {
    x: Int;
    y: NestedY;
    z: NestedZ;
}

struct NestedY {
    y1: Int;
}

struct NestedZ {
    z1: NestedZ1;
}

struct NestedZ1 {
    num: Int;
}

contract Test {
    data: MultiLevelStruct;

    init() {
        self.data = MultiLevelStruct{
            x: 10,
            y: NestedY{y1:20},
            z: NestedZ{ z1: NestedZ1{num:30} }
        };
    }
}