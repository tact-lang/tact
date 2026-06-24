struct I {
    val: Int;
}
struct J {
    val: Bool;
}
struct K {
    val: String;
}

struct Container {
    a: I;
    b: J;
    c: K;
}

contract DiffTypesNest {
    data: Container;

    init() {
        self.data = Container{
            a: I{val:1},
            b: J{val:true},
            c: K{val:"hello"}
        };
    }
}
