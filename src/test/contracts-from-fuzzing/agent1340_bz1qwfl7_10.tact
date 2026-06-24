struct Tiny {
    flag: Bool;
}

struct WithDefaults {
    name: String = "default";
    status: Bool = true;
    number: Int = 42;
    tiny: Tiny = Tiny{ flag: false };
}

contract StructWithDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}