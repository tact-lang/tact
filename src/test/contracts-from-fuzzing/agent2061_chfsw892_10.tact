struct Defaults {
    a: Int = 123;
    b: Bool?;
    c: String = "xyz";
}

contract DefContract {
    store: Defaults;

    init() {
        self.store = Defaults{
            b: null,
        };
    }
}