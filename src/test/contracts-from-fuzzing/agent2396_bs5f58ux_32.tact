struct OptContainer {
    a: Int?;
}

contract StateWithOpt {
    f: OptContainer;

    init() {
        self.f = OptContainer{ a: null };
    }
}
