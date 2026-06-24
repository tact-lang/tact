// Big chain of nested optional structs
struct S4 {
    v: Int?;
}

struct S3 {
    s4: S4?;
}

struct S2 {
    s3: S3?;
}

struct S1 {
    s2: S2?;
}

contract DeepOptionals {
    data: S1;
    init() {
        self.data = S1{ s2: null };
    }
}
