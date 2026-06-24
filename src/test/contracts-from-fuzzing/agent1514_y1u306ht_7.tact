struct ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
}

contract TestContract {
    data: ManyFields = ManyFields{
        a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:false,i:5,j:true
    };

    init() {
        self.data = ManyFields{
            a:6,b:false,c:7,d:true,e:8,f:false,g:9,h:true,i:10,j:false
        };
    }
}