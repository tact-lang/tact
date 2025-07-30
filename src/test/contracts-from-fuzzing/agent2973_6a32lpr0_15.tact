struct DefaultOptions {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract DefOptTest {
    f: DefaultOptions;

    init() {
        self.f = DefaultOptions{}; // use defaults
    }
}