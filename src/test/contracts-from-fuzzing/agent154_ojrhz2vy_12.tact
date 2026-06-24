struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptStructHolder {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            a:null, b:true, c:null, d:null, e:null, f:null, g:null
        };
    }
}