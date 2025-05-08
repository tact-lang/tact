struct Sub {
    a: Int;
    b: String;
    c: Bool;
}

struct Top {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

contract RepeatedSubs {
    outer: Top;

    init() {
        self.outer = Top{
            s1: Sub{a:1, b:"x", c:true},
            s2: Sub{a:2, b:"y", c:false},
            s3: Sub{a:3, b:"z", c:true}
        };
    }
}