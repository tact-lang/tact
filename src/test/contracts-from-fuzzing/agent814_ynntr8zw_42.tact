// contract parameters with complex deep optional/default
struct Bottom {
    x: Int = 5;
    y: Bool?;
}

struct Mid {
    nested: Bottom?;
    s: String;
}

contract ParamsDeepOpt(
    par: Mid?
) {}