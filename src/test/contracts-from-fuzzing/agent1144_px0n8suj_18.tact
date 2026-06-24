// test nested optional primitives
struct OptionalPrims {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct Container {
    opt: OptionalPrims?;
}

contract OptionalPrimsContract {
    c: Container;

    init() {
        self.c = Container{ opt: null };
    }
}