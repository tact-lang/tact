struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}