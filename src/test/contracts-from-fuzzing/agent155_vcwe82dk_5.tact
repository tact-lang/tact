struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    opts: ManyOptionals = ManyOptionals{};

    init() {
        self.opts = ManyOptionals{};
    }
}