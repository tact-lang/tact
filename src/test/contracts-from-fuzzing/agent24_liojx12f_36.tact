// Nested optional record, middle layer is null
struct Bottom {
    a: Int;
}

struct Mid {
    b: Bottom?;
}

struct Top {
    m: Mid?;
}

contract Test {
    t: Top = Top{
        m: null
    };

    init() {}
}