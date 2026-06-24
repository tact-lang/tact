// Chain deeply nested optionals with defaults
struct Layer3 {
    x: Int? = null;
}

struct Layer2 {
    l3: Layer3? = null;
}

struct Layer1 {
    l2: Layer2? = null;
}

contract DeepOptDefaults {
    state: Layer1;

    init() {
        self.state = Layer1{};
    }
}
