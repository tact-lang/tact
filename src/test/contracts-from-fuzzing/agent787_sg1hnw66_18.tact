struct ManyOptDefaults {
    a: Int? = 1;
    b: Bool? = false;
    c: String? = "hi";
    d: Address? = null;
}

contract TestContract {
    data: ManyOptDefaults = ManyOptDefaults{};

    init() {
        self.data = ManyOptDefaults{ b: true, d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c") };
    }
}