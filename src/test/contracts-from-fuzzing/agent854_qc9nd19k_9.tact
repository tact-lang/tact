struct SubOpt {
    v: Int = 5;
}

struct Mix {
    a: Int = 1;
    b: Bool = true;
    c: SubOpt? = null;
    d: String = "x";
    e: SubOpt? = null;
}

contract TestContract {
    stuff: Mix = Mix{};
    init() {}
}
