struct DefInit {
    a: Int = 5;
    b: Bool = false;
}

contract InitDefaults {
    store: DefInit;

    init() {
        self.store = DefInit{};
    }
}