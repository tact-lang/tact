struct DefaultsTop {
    a: Int = 5;
    b: String = "default";
    c: Bool = true;
    d: Int? = null;
}

contract DefaultsContract {
    storage: DefaultsTop;

    init() {
        self.storage = DefaultsTop{}; // omit all, rely on defaults
    }
}