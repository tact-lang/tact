struct Complex1 {
    x: Int;
}

struct Complex2 {
    y: Complex1;
}

contract ParamDeepOpt(
    x: Complex2?,
) {}
