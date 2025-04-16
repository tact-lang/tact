// nested complex with optional inners
struct Sub {
    s: String?;
    b: Bool?;
}

struct Container {
    sub: Sub?;
    maybeVal: Int?;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            sub: null,
            maybeVal: 5
        };
    }
}