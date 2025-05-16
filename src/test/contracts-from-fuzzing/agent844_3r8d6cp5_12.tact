struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Opts {
    m: ManyOptionals = ManyOptionals{a:null,b:null,c:null,d:null,e:null,f:null};
}