struct A {
    flag: Bool?;
    count: Int as uint4;
}

struct B {
    desc: String?;
    sum: Int as int64;
}

struct C {
    a: A;
    b: B;
    info: String;
}

contract LayeredStructs {
    data: C;

    init() {
        self.data = C {
            a: A{flag:null,count:7},
            b: B{desc:null,sum:1234567},
            info: "Layered",
        };
    }
}