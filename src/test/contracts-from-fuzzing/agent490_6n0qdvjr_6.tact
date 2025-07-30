struct InnerStruct {
    a: Int;
}

struct OuterStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

contract MultiNested {
    state: OuterStruct;
    init() {
        self.state = OuterStruct{
            inner1: InnerStruct{a: 1},
            inner2: InnerStruct{a: 2}
        };
    }
}