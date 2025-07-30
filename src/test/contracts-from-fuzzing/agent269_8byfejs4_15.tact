struct Sub {
    kind: Int as uint4;
    info: String;
    flag: Bool;
}

struct Top {
    a: Int;
    sub1: Sub;
    sub2: Sub;
}

contract MixedNest {
    data: Top;

    init() {
        self.data = Top{
            a: 50,
            sub1: Sub{ kind: 1, info: "x", flag:true },
            sub2: Sub{ kind: 2, info: "y", flag:false }
        };
    }
}