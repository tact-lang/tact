struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
    f: String?;
}

contract Test {
    d1: DeepOptionals;
    d2: DeepOptionals;
    
    init() {
        self.d1 = DeepOptionals{a:null,b:null,c:null,d:null,e:null,f:null};
        self.d2 = DeepOptionals{a:1,b:true,c:null,d:emptyCell().asSlice(),e:emptyCell(),f:"x"};
    }
}