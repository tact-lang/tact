struct OptionalStruct {
    i: Int?;
    b: Bool?;
    s: String?;
    sl: Slice?;
    c: Cell?;
    a: Address?;
}

contract OptionalEverything {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            i:null,b:null,s:null,sl:null,c:null,a:null
        };
    }
}