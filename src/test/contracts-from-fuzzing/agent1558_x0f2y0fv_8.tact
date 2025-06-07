struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct NestStructs {
    f1: Inner1;
    f2: Inner2;
    flag: Bool;
    text: String?;
}

contract WithNestedStructs {
    store: NestStructs;

    init() {
        self.store = NestStructs{
            f1: Inner1{ a: 1 },
            f2: Inner2{ b: true },
            flag: false,
            text: null
        };
    }
}