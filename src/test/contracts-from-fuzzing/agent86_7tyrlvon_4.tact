struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Bool;
    h: String;
    i: Int;
    j: Bool;
    k: String;
    l: Int;
    m: Bool;
    n: String;
    o: Bool;
    p: Int;
}

contract LargeStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a:1,b:true,c:"c",d:2,e:false,f:"f",g:true,h:"h",i:3,j:false,k:"k",l:4,m:true,n:"n",o:false,p:5
        };
    }
}