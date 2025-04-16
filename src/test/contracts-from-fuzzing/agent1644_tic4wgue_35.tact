struct Tiny {
    val: Int? as int8;
}

struct Mid {
    optTiny: Tiny?;
}

contract DeepOptSer {
    fld: Mid = Mid{ optTiny: null };

    init() {}
}