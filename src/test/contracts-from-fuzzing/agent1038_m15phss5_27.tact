struct Opt1 {
    f1: Int?;
}

struct Opt2 {
    f2: Opt1?;
}

struct Opt3 {
    f3: Opt2?;
}

contract TripleOptionalStruct {
    data: Opt3? = null;
    init() {}
}