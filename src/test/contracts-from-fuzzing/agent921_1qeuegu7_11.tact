struct HasManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract StructOfOptionals {
    s: HasManyOptionals;
    init() {
        self.s = HasManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null
        };
    }
}