struct ComplexOptional {
    x: Int?;
    y: Bool?;
    z: String?;
    c: Cell?;
    s: Slice?;
    a: Address?;
}

contract ComplexOptionalContract {
    data: ComplexOptional;
    init() {
        self.data = ComplexOptional{ x:null,y:null,z:null,c:null,s:null,a:null };
    }
}