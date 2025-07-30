struct OptionalInitial {
    txt: String?;
    val: Int?;
}

contract OptionalInitialContract {
    storage: OptionalInitial;

    init() {
        self.storage = OptionalInitial { txt: null, val: null };
    }
}