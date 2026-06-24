struct EmptyOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract ImplicitNulls {
    val: EmptyOpt;

    init() {
        self.val = EmptyOpt{};
    }
}