struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
}

contract TestContract {
    storage: OnlyOptionals;

    init() {
        self.storage = OnlyOptionals{ a: null, b: null, c: null };
    }
}