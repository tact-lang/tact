struct Defaults {
    n: Int = 42;
    s: String = "hello";
    b: Bool = true;
}

contract DefaultInit {
    data: Defaults;
    init() {
        self.data = Defaults{}; // rely on defaults
    }
}
