struct S {
    a: Int;
    b: String;
}

struct T {
    c: Bool;
    s_field: S;
    opt_field: String?;
}

contract TestContract {
    tField: T;

    init() {
        self.tField = T{
            c: true,
            s_field: S{
                a: 1,
                b: "x",
            },
            opt_field: null,
        };
    }
}
