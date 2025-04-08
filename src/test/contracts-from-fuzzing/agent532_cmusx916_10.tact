struct S1 {
    foo: Int;
}

struct S2 {
    bar: S1;
}

struct S3 {
    baz: S2;
}

struct S4 {
    qux: S3;
}

struct S5 {
    fuzz: S4;
}

struct S6 {
    buzz: S5;
}

contract LongerNested {
    val: S6;

    init() {
        self.val = S6{buzz:S5{fuzz:S4{qux:S3{baz:S2{bar:S1{foo:77}}}}}};
    }
}