struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

struct S3 {
    c: Address;
}

struct Container {
    f1: S1;
    f2: S2;
    f3: S3;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            f1: S1{a:77},
            f2: S2{b:false},
            f3: S3{c:myAddress()}
        };
    }
}