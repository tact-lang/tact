struct BigNested {
    inner1: InnerStruct;
    inner2: InnerStruct;
    inner3: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract BigNestedStructs {
    all: BigNested;
    
    init() {
        self.all = BigNested{
            inner1: InnerStruct{x: 1, y: false, z: "a"},
            inner2: InnerStruct{x: 2, y: true, z: "b"},
            inner3: InnerStruct{x: 3, y: false, z: "c"}
        };
    }
}
