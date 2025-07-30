struct EmptyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract EmptyInits {
    s: EmptyOptionals;

    init() {
        self.s = EmptyOptionals{};
    }
}