struct Sub {
    b: Bool;
}

struct MidOpt {
    s: Sub?;
}

struct TopOpt {
    m: MidOpt?;
}

contract MultiOpt {
    val: TopOpt = TopOpt{m: null};
}
