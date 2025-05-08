struct Small {
    x: Int;
}

contract OptionalInitNull {
    f: Small? = null;

    init() {
        self.f = null;
    }
}