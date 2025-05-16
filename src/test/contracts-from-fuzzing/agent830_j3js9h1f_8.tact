struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    stuff: ManyOptionals;

    init() {
        self.stuff = ManyOptionals{
            a:null,b:true,c:"str",d:42,e:false,f:null
        };
    }
}