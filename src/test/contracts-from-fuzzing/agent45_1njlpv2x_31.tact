struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Address?;
    f: Slice?;
    g: Cell?;
    h: String?;
}

contract ManyNestedNullables {
    val: ManyOptionals;
    
    init() {
        self.val = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}
