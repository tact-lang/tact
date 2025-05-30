struct MultiOpt {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct Container {
    m: MultiOpt?;
}

contract Test {
    data: Container = Container{ m: null };
    init() {}
}