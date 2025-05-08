struct Internals {
    a: Int? = null;
    b: Bool = false;
    c: String = "zzz";
}

contract TestContract {
    store: Internals? = null;

    init() {
        self.store = null;
    }
}