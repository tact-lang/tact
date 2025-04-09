contract NestedOptionStructs {
    s1: Struct1;

    init() {
        self.s1 = Struct1{
            a: null,
            inner: Struct2{b: 3, c: null},
        };
    }
}

struct Struct1 {
    a: Int?;
    inner: Struct2;
}

struct Struct2 {
    b: Int;
    c: String?;
}