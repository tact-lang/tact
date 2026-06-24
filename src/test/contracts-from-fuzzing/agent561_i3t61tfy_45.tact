struct WierdOrdering {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract StorageOrdering {
    foo: WierdOrdering;

    init() {
        self.foo = WierdOrdering{
            a:1,b:null,c:"abc",d:null,e:true,f:null
        };
    }
}