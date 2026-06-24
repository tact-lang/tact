struct AA { a: Int? = null; }
struct BB { b: Bool? = null; }
struct CC { c: String? = null; }

struct Combo {
    aa: AA? = null;
    bb: BB? = null;
    cc: CC? = null;
}

contract SuperOpt {
    val: Combo? = null;
}