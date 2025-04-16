struct ManyOptionals {
    a: Int?; b: Int?; c: String?; d: Bool?; e: Address?;
    f: Cell?; g: Slice?; h: Builder?; i: String?;
}

contract TestContract {
    mo: ManyOptionals;

    init() {
        self.mo = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null
        };
    }
}