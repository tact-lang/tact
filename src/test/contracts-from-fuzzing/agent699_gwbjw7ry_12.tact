struct OptMany {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ImplicitNulls {
    data: OptMany;

    init() {
        self.data = OptMany{};
    }
}
