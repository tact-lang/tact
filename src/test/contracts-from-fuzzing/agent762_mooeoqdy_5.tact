struct ComplexOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Slice?;
    f: Cell?;
}

contract TestContract {
    data: ComplexOptional;
    
    init() {
        self.data = ComplexOptional{a:null,b:null,c:null,d:null,e:null,f:null};
    }
    
    receive() {
        self.data = ComplexOptional{
            a:123,
            b:true,
            c:myAddress(),
            d:"str",
            e:emptyCell().asSlice(),
            f:emptyCell()
        };
    }
}