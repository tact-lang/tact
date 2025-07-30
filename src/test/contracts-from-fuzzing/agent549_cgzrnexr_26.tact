struct Tricky {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool;
    e: Int?;
    f: Bool?;
}

contract ManyNulls {
    m: Tricky;

    init() {
        self.m = Tricky{ a:1,b:null,c:2,d:false,e:null,f:null };
    }

    receive() {
        self.m = Tricky{ a:10,b:true,c:20,d:true,e:30,f:false };
    }
}