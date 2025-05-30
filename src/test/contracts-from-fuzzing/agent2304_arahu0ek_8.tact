struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract OptionalFields {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}