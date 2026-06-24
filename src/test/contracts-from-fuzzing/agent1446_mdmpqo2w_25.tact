struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct T {
    s: S;
}

contract NestOpt {
    data: T;
    init() {
        self.data = T{
            s: S{
                a: null,
                b: false,
                c: null
            }
        };
    }
}
