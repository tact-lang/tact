struct NestOptDefault {
    i: Int = 1;
    o: Int? = null;
    s: Sub? = null;
}

struct Sub {
    a: Int;
    b: Bool;
}

contract TestContract {
    n: NestOptDefault;
    init() {
        self.n = NestOptDefault{};
    }
}