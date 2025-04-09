struct BigDeep1 {
    a: Int;
    b: Bool;
    c: Int?;
}

struct BigDeep2 {
    d: BigDeep1;
    e: Int;
    f: Bool?;
}

struct BigDeep3 {
    g: BigDeep2;
    h: Int;
    i: Bool;
}

struct BigDeep4 {
    j: BigDeep3;
    k: Int?;
    l: Bool;
}

contract BigDeepChain {
    x: BigDeep4;

    init() {
        self.x = BigDeep4{
            j: BigDeep3{
                g: BigDeep2{
                    d: BigDeep1{ a:1, b:true, c:null },
                    e:5,
                    f:false,
                },
                h:6,
                i:true,
            },
            k:null,
            l:false,
        };
    }
}