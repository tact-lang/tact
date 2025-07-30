struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
}

contract TestContract {
    foo: ManyOptionals;

    init() {
        self.foo = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}