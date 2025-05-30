struct ABig {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
}

contract AssignChain {
    x: ABig = ABig{a:1,b:true,c:null,d:null,e:5,f:false};

    init() {
        self.x = ABig{a:10,b:false,c:20,d:true,e:30,f:true};
    }
}