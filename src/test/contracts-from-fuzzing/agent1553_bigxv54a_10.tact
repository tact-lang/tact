struct Big1 {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
}

struct Big2 {
    e: Big1;
    f: Big1;
    g: Big1;
}

struct Big3 {
    h: Big2;
    i: Big2;
}

contract TestX {
    data: Big3;

    init() {
        self.data = Big3{
            h: Big2{
                e: Big1{a:1,b:true,c:"X",d:2},
                f: Big1{a:3,b:false,c:"Y",d:4},
                g: Big1{a:5,b:true,c:"Z",d:6}
            },
            i: Big2{
                e: Big1{a:7,b:false,c:"K",d:8},
                f: Big1{a:9,b:true,c:"L",d:10},
                g: Big1{a:11,b:false,c:"M",d:12}
            }
        };
    }
}