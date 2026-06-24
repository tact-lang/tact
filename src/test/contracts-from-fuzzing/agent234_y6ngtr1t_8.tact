struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

struct BiggestNested {
    n1: BigNested;
    n2: BigNested?;
    n3: BigNested;
}

contract SoBig {
    state: BiggestNested;

    init() {
        self.state = BiggestNested{
            n1: BigNested{a:1,b:"x",c:true,d:null,e:null,f:null},
            n2: null,
            n3: BigNested{a:2,b:"y",c:false,d:null,e:null,f:null}
        };
    }
}