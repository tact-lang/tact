struct Sub1 {
    foo: Bool;
}
struct Sub2 {
    bar: Bool;
}
struct Sub3 {
    baz: Bool;
}

struct Container {
    s1: Sub1;
    s2: Sub2;
    s3: Sub3;
}

contract ManySubs {
    c: Container;

    init() {
        self.c = Container{
            s1: Sub1{foo: true},
            s2: Sub2{bar: false},
            s3: Sub3{baz: true},
        };
    }
}
