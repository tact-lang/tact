struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
}

struct Container {
    inner: ManyOpts?;
}

contract Test {
    c: Container = Container{ inner: null };
}