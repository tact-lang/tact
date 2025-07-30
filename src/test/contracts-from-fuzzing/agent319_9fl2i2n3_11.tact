struct Inner {
    f1: Int;
    f2: Int;
}

struct WithArrayLike {
    s1: Inner;
    s2: Inner;
    s3: Inner;
    s4: Inner;
}

contract ManyNestedStructs {
    data: WithArrayLike;

    init() {
        self.data = WithArrayLike{
            s1: Inner{f1:1,f2:1},
            s2: Inner{f1:2,f2:2},
            s3: Inner{f1:3,f2:3},
            s4: Inner{f1:4,f2:4},
        };
    }
}