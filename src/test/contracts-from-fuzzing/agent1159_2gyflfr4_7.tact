struct Defaults {
    x: Int = 3;
    y: Bool = true;
    s: String = "abc";
}

contract TestContract {
    defaults: Defaults;

    init() {
        self.defaults = Defaults{};
    }
}