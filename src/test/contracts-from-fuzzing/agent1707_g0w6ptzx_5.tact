struct InnerStruct {
    a: Int;
    b: String?;
}

struct MiddleStruct {
    x: Bool;
    y: InnerStruct;
    z: String;
}

struct OuterStruct {
    m: Int?;
    n: MiddleStruct;
    p: Bool?;
}

contract TestContract {
    data: OuterStruct;
    
    init() {
        self.data = OuterStruct{
            m: null,
            n: MiddleStruct{
                x: true,
                y: InnerStruct{ a: 7, b: null },
                z: "test"
            },
            p: false
        };
    }
}
