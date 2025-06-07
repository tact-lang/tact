struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: String?;
    e: Int?;
    f: String?;
}

contract LotsOfOptionals {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{a:null,b:null,c:null,d:null,e:null,f:null};
    }
}
