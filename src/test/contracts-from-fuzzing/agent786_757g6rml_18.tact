struct Struct1 {
    a: Int;
}

struct Struct2 {
    b: Int;
}

struct Combining {
    s1: Struct1;
    s2: Struct2;
    s3: Struct1;
}

contract DupStructsEmbedded {
    val: Combining;

    init() {
        self.val = Combining{
            s1: Struct1{a:1},
            s2: Struct2{b:2},
            s3: Struct1{a:3}
        };
    }
}