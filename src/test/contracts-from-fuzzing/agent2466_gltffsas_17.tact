struct PrimitiveOptional {
    a: Address?;
    s: String?;
    c: Cell?;
    sl: Slice?;
    b: Builder?;
}

contract ComplexOpts {
    opts: PrimitiveOptional = PrimitiveOptional{
        a:null,s:null,c:null,sl:null,b:null
    };
    init() {}
}