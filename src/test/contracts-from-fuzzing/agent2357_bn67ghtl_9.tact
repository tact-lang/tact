struct InnerPunned {
    a: Int;
    b: Int?;
}

struct OuterPunned {
    inner: InnerPunned;
    another: Int;
}

contract DefaultsAndPunning {
    s: OuterPunned;

    init() {
        let a = 5;
        let b: Int? = null;
        let inner = InnerPunned{ a, b };
        self.s = OuterPunned{ inner, another: 10 };
    }
}
