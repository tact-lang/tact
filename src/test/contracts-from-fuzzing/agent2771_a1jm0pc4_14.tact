struct ComplexOptional {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptionalPrimitives {
    val: ComplexOptional;

    init() {
        self.val = ComplexOptional{
            i:null, b:null, s:null, a:null, c:null, sl:null
        };
    }
}