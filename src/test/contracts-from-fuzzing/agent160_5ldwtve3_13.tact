struct Subs {
    a: Int;
    b: Int;
}

struct Root {
    sub1: Subs;
    sub2: Subs;
    sub3: Subs;
    sub4: Subs;
    sub5: Subs;
}

contract TestWideSubs {
    data: Root;
    init() {
        self.data = Root{
            sub1: Subs{a:1,b:2},
            sub2: Subs{a:3,b:4},
            sub3: Subs{a:5,b:6},
            sub4: Subs{a:7,b:8},
            sub5: Subs{a:9,b:10},
        };
    }
}