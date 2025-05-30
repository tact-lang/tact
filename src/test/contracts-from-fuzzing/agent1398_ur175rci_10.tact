struct DefaultsNest {
    n: Int = 5;
    s: String = "default";
    b: Bool = true;
    o: Int? = null;
}

contract DefaultsNested {
    container: DefaultsNest;

    init() {
        self.container = DefaultsNest{};
    }
}