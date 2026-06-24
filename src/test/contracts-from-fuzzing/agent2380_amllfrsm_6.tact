struct Sub {
    sub1: Int?;
    sub2: Int;
}

struct Mid {
    mfield: Sub;
    mopt: Bool?;
    mstr: String;
}

struct Top {
    tf: Mid;
    tnum: Int;
    tbool: Bool;
}

contract TestContract {
    value: Top;
    init() {
        self.value = Top{
            tf: Mid{
                mfield: Sub{ sub1: 55, sub2: 66 },
                mopt: null,
                mstr: "hi"
            },
            tnum: 77,
            tbool: true
        };
    }
}