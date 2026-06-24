struct InnerA {
    s: String;
    n: Int?;
}

struct InnerB {
    a: InnerA?;
    val: Int;
}

contract ComplexOpt {
    b: InnerB;

    init() {
        self.b = InnerB{
            a: null,
            val: 55
        };
    }
}