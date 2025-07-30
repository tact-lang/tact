// Many optionals nested within struct
struct OStruct {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract DeepOptStruct {
    v: OStruct;

    init() {
        self.v = OStruct{a:null,b:null,c:null,d:null,e:null,f:null};
    }
}