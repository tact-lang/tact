struct OptScalars {
    i: Int?;
    s: String?;
    b: Bool?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
}

contract OptionalScalars {
    val: OptScalars;
    init() {
        self.val = OptScalars{
            i:null,s:null,b:null,c:null,sl:null,a:null
        };
    }
}