struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Bool?;
    f: Int?;
}

contract MultipleOptFields {
    val: ManyOptionals;
    init() {
        self.val = ManyOptionals{
            a:null,b:2,c:true,d:null,e:false,f:42
        };
    }
}
