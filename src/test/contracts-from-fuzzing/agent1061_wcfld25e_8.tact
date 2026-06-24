struct InnerStruct { x: Int; y: Int; flag: Bool; }

struct MidStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
    label: String;
}

contract Test {
    data: MidStruct;

    init() {
        self.data = MidStruct{
            inner1: InnerStruct{ x:1, y:2, flag:true },
            inner2: InnerStruct{ x:3, y:4, flag:false },
            label: "hello"
        };
    }
}