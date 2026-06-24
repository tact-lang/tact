struct InnerStruct {
    a: Int;
}

struct MidStruct {
    inner: InnerStruct;
}

struct OuterStruct {
    mid: MidStruct;
}

contract DeepNest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct {
            mid: MidStruct {
                inner: InnerStruct { a: 123 }
            }
        };
    }
}