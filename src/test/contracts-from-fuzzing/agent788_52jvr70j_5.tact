struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Inner3 {
    c: Bool;
}

contract ManyStructs {
    s1: Inner1;
    s2: Inner2;
    s3: Inner3;

    init() {
        self.s1 = Inner1{a: 3};
        self.s2 = Inner2{b: 4};
        self.s3 = Inner3{c: true};
    }
}