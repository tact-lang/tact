// large mix nested with optional + default + explicit init

struct DS1 {
    a: Int? = null;
    b: Bool;
    c: String?;
}

struct DS2 {
    s1: DS1? = null;
    s2: DS1;
    val: Int;
}

contract ComplexMix {
    field: DS2;

    init() {
        self.field = DS2{
            s1: null,
            s2: DS1{ a: null, b: true, c: null },
            val: 42,
        };
    }
}