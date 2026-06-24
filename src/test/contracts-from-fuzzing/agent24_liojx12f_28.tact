// Nested structs, innermost optional Int
struct Inmost {
    val: Int?;
}

struct Mid {
    nest: Inmost;
}

struct Top {
    mid: Mid?;
}

contract Test {
    top: Top = Top{
        mid: null
    };

    init() {}
}