struct Mega {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool;
}

contract TestContract {
    big: Mega;

    init() {
        self.big = Mega{
            a:1,b:true,c:null,d:false,e:2,f:true,g:3,h:null,i:4,j:false,k:5,l:true
        };
    }
}