struct Inner1 {
    a: Int?;
}
struct Inner2 {
    b: String?;
}
struct Inner3 {
    c: Bool?;
}

struct Compose {
    s1: Inner1;
    s2: Inner2;
    s3: Inner3;
}

contract OptionalStructs {
    field: Compose;
    init() {
        self.field = Compose{
            s1: Inner1{ a: null },
            s2: Inner2{ b: null },
            s3: Inner3{ c: null }
        };
    }
}
