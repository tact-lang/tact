struct Sub {
    a: Int?;
    b: Int;
}

struct Container {
    s1: Sub;
    s2: Sub;
    m: Int;
    n: Int?;
}

contract Box {
    k: Container;

    init() {
        self.k = Container{
            s1: Sub{a:null,b:1},
            s2: Sub{a:2,b:3},
            m:4,
            n:null
        };
    }
}