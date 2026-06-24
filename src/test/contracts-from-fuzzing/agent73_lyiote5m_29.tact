struct Base {
    a: Int;
    b: Int?;
}

struct WithDefault {
    p: Base = Base{ a: 5, b: null };
}

contract Test {
    data: WithDefault;

    init() {
        self.data = WithDefault{};
    }
}