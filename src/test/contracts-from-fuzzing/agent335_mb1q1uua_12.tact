struct MiddleStruct {
    x: Int;
    y: Bool;
}

struct OuterStruct {
    m1: MiddleStruct;
    m2: MiddleStruct;
    z: Int;
}

contract MultiNestedContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct {
            m1: MiddleStruct{x:1, y:true},
            m2: MiddleStruct{x:2, y:false},
            z: 42
        };
    }
}