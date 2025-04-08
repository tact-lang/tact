struct HasDefaultOpt {
    a: Int? = null;
    b: String? = null;
}

contract DefOptTest {
    d: HasDefaultOpt;

    init() {
        self.d = HasDefaultOpt{};
    }
}