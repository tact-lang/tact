struct Sub {
    alpha: Int;
    beta: Bool;
}

struct Mid {
    s1: Sub;
    s2: Sub;
}

struct Top {
    middle: Mid;
    flag: Bool;
}

contract MultiNest {
    data: Top;
    init() {
        self.data = Top{
            middle: Mid{
                s1: Sub{ alpha: 10, beta: true },
                s2: Sub{ alpha: 20, beta: false }
            },
            flag: true
        };
    }
}