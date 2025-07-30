struct S1 {
    f1: Int;
}

struct S2 {
    f2: S1;
}

struct S3 {
    f3: S2;
}

struct S4 {
    f4: S3;
}

struct S5 {
    f5: S4;
}

contract FiveNestings {
    deep: S5;

    init() {
        self.deep = S5{f5: S4{f4: S3{f3: S2{f2: S1{f1: 5}}}}};
    }

    receive() {
        self.deep.f5.f4.f3.f2.f1 = 99;
    }
}
