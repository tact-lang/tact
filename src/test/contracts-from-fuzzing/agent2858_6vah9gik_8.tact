struct Param {
    x: Int;
}

struct WithNestedDefault {
    p: Param = Param { x: 42 };
}

contract TestContract {
    data: WithNestedDefault;

    init() {
        self.data = WithNestedDefault{};
    }
}