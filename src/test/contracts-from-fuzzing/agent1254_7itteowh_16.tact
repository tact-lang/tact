struct InnerMost2 {
    d: Int;
}

struct Inner2 {
    c: InnerMost2;
}

struct Inner1 {
    b: Inner2;
}

struct Top {
    a: Inner1;
}

contract FourLevelNesting {
    val: Top;
    init() {
        self.val = Top{
            a: Inner1{
                b: Inner2{
                    c: InnerMost2{
                        d: 777,
                    },
                },
            },
        };
    }
}