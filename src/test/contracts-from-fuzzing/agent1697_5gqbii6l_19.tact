struct DefaultsAndOptions {
    a: Int = 1;
    b: Int?;
    c: Int? = null;
    d: Bool = false;
    e: Bool?;
    f: Bool? = null;
}

contract TestContract {
    f: DefaultsAndOptions;

    init() {
        self.f = DefaultsAndOptions{};
    }
}