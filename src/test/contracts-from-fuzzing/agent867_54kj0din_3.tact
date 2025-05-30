struct Large {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: String;
    i: String;
    j: Bool;
    k: Int;
    l: Int;
}

contract TestContract {
    rec: Large = Large{
        a:1,b:2,c:3,d:4,e:5,f:true,g:false,h:"h",i:"i",j:true,k:6,l:7
    };

    init() {
        self.rec = Large{
            a:10,b:20,c:30,d:40,e:50,f:false,g:true,h:"mod_h",i:"mod_i",j:false,k:60,l:70
        };
    }
}
