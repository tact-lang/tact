struct IncludeOptionals {
    a: Int; 
    b: Bool;
    c: String?;
    d: Slice?;
    e: Address;
    f: Int?;
    g: Bool?;
}

contract StructOptionals {
    val: IncludeOptionals;

    init() {
        self.val = IncludeOptionals{
            a:1, b:true, c:null, d:null, e:myAddress(), f:null, g:null
        };
    }
}