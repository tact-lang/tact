struct Multilevel {
    a: Int;
    b: Int?;
    c: Inner;
}

struct Inner {
    x: Bool;
    y: Bool?;
}

contract MultiNested {
    m: Multilevel;

    init() {
        self.m = Multilevel{
            a:1,
            b:null,
            c: Inner{ x:true, y:null }
        };
    }
}
