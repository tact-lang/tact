struct Alpha {
    x: Int;
}

struct Beta {
    a: Alpha;
}

struct Gamma {
    b: Beta;
}

struct Delta {
    c: Gamma;
}

contract DeepChainParam(
    d: Delta
) {}
