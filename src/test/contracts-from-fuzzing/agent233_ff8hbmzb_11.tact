struct Sub {
    k: Int?;
}

struct Big {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Address;
    sub: Sub?;
}

contract MultiBig {
    b1: Big;
    b2: Big;
    b3: Big?;

    init() {
        self.b1 = Big{a:1,b:null,c:true,d:"hello",e:myAddress(),sub:null};
        self.b2 = Big{a:2,b:5,c:false,d:null,e:myAddress(),sub:Sub{k:null}};
        self.b3 = null;
    }

    receive() {
        if(self.b3!=null){let _=self.b3!!.a;}
    }
}