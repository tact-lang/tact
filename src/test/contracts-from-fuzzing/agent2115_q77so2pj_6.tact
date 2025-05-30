// Test uninitialized nested optional fields inside struct
struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    nested: OptionalNest = OptionalNest{};
    name: String = "X";
}

contract ComplexOpt {
    c: Container = Container{};
    init() {}
}