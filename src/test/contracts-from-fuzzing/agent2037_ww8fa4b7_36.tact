// Nested optionals deep inside, with outer default
struct Core {
    x: Int?;
}

struct Wrapper {
    core: Core?;
}

contract OptOptDefaults {
    outer: Wrapper = Wrapper{ core: null };

    init() {
        self.outer = Wrapper{
            core: null
        };
    }
}
