struct MixedOptionals {
    a: Int? = null;
    b: Bool?;
    c: String?;
    d: Int?;
}

contract ImplicitExplicitOptions {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{};
    }
}