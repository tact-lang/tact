const BASE_VAL: Int = 42;

struct WithDefault {
    x: Int = BASE_VAL + 1;
}

contract StructWithConstDefault {
    data: WithDefault;

    init() {
        self.data = WithDefault{};
    }
}