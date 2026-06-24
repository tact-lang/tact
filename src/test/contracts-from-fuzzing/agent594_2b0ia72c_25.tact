struct Core {
    x: Int;
}

struct OptionalWithDefault {
    core: Core? = Core{x: 777};
}

contract Test25 {
    field: OptionalWithDefault;

    init() {
        self.field = OptionalWithDefault{};
    }

    receive() {}
}