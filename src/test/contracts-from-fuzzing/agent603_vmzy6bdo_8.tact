struct ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
    k: Bool;
}

contract TestContract {
    data: ManyBools;

    init() {
        self.data = ManyBools{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false,i:true,j:false,k:true
        };
    }
}