struct EmptyOptionals {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract Hold {
    eo: EmptyOptionals;

    init() { self.eo = EmptyOptionals{}; }
}