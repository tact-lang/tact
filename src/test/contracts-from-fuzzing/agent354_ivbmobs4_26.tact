struct Chain {
    a: Int;
    b: String;
    c: Bool;
    d: Chain2;
}

struct Chain2 {
    e: Int;
    f: String;
    g: Bool;
    h: Chain3;
}

struct Chain3 {
    i: Int;
    j: String;
    k: Bool;
}

contract ChainNested {
    data: Chain;

    init() {
        self.data = Chain{
            a:1,
            b:"b",
            c:true,
            d: Chain2{
                e:2,
                f:"f",
                g:false,
                h: Chain3{
                    i:3,
                    j:"j",
                    k:true
                }
            }
        };
    }
}