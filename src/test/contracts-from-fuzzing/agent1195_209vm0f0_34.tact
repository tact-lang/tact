struct Mid {
    a: Int?;
    b: Bool;
}

struct Out {
    m: Mid;
    x: Int;
}

contract Combination {
    f: Out;

    init() {
        self.f = Out{ m: Mid{a:null, b:true}, x:10 };
    }
}
