struct Mid {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
}

struct Out {
    alpha: Mid;
    beta: Mid;
}

contract Doubly {
    oo: Out;

    init() {
        self.oo = Out{
            alpha: Mid{a:1,b:null,c:true,d:"foo"},
            beta: Mid{a:2,b:10,c:false,d:null}
        };
    }
}
