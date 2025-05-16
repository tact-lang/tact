struct Sub {
    a: Int;
    b: Bool;
}

struct Middle {
    s: Sub;
    c: Int;
}

struct Top {
    m1: Middle;
    m2: Middle;
    flag: Bool;
}

contract DeepMultiNested {
    data: Top;
    init() {
        self.data = Top{
            m1: Middle{
                s: Sub{a:1,b:true},
                c: 2
            },
            m2: Middle{
                s: Sub{a:3,b:false},
                c: 4
            },
            flag: true
        };
    }
}