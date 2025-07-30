struct MultiLevels {
    s1: S1;
    s2: S2;
}

struct S1 {
    flag: Bool;
    sub: S3;
}

struct S2 {
    num: Int;
    optInner: S4?;
}

struct S3 {
    a: Int;
}

struct S4 {
    b: Bool;
}

contract CompLevelsContract {
    data: MultiLevels;

    init() {
        self.data = MultiLevels{
            s1: S1{ flag:true, sub:S3{a:1} },
            s2: S2{ num:5, optInner:null },
        };
    }
}