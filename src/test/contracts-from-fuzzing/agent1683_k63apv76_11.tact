struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Int;
    f: Int;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract TestContract {
    mt: ManyTypes = ManyTypes{
        a:1,b:true,c:"hi",d:0,e:0,f:0,
        g:null,h:null,i:null
    };
}