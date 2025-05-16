struct Big {
    i: Int;
    j: Int;
    k: Int;
    l: Int;
    m: Int;
    n: Int;
    o: Int;
    p: Int;
    q: Int;
    r: Int;
}

struct Wrapper {
    b: Big;
    name: String;
}

contract Test17 {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            b: Big{
                i:1,j:2,k:3,l:4,m:5,n:6,o:7,p:8,q:9,r:10,
            },
            name: "big",
        };
    }
}
