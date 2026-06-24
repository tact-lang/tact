message(0x42) E {}

struct Container {
    m: E;
}

contract CT {
    data: Container = Container{ m: E{} };

    init() {}
}