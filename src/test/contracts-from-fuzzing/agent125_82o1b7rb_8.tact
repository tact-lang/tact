struct EmptyOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    storage: EmptyOptional;
    init() {
        self.storage = EmptyOptional{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}