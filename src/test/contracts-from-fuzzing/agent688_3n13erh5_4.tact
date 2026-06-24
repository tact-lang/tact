struct Proto {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Address;
}

struct Middle {
    p: Proto;
    q: Proto;
    r: Proto;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            p: Proto{a:1,b:null,c:true,d:"x",e: myAddress()},
            q: Proto{a:2,b:2,c:false,d:"y",e: myAddress()},
            r: Proto{a:3,b:3,c:true,d:"z",e: myAddress()},
        };
    }
}