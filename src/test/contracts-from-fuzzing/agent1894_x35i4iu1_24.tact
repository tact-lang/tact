struct OuterStruct {
    x: Int;
    s: InnerStruct;
}

struct InnerStruct {
    y: Bool;
    z: String;
}

contract DeepOrder {
    os: OuterStruct;
    init() {
        self.os = OuterStruct{ x:5, s: InnerStruct{ y:true, z:"abc" } };
    }
}