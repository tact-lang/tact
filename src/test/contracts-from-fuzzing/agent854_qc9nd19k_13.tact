struct S1 { a: Int = 1; }
struct S2 { b: Bool = true; }

struct Combo {
    sa: S1? = null;
    sb: S2? = null;
}

contract TestContract {
    val: Combo = Combo{};
    init() {}
}
