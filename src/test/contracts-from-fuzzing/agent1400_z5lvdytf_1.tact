struct NestedStruct {
    x: Int;
    y: Bool;
    sub: SubStruct;
}

struct SubStruct {
    flag: Bool;
}

contract TestPersistent {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            x: 1,
            y: true,
            sub: SubStruct{flag: false}
        };
    }
}
