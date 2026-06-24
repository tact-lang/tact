struct InnerStruct {
    a: Int as uint8;
    b: Bool;
    c: String?;
}

struct OuterStruct {
    inner: InnerStruct;
    flag: Bool;
}

contract NestedSerializedStructs {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{inner: InnerStruct{a:1,b:true,c:null}, flag:false};
    }
}