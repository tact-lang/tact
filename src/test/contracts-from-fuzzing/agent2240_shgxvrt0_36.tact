struct HasAllOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract AllOptionalsNested {
    container: HasAllOpts?;

    init() {
        self.container = HasAllOpts{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}