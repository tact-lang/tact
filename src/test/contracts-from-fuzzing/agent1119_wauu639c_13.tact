struct S1 {
    val: Int;
}

struct S2 {
    inside: S1;
}

struct S3 {
    nested: S2;
}

struct S4 {
    deeper: S3;
}

contract DeepStruct {
    x: S4;

    init() {
        self.x = S4{deeper: S3{nested: S2{inside: S1{val: 100}}}};
    }
}