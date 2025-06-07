struct DefaultInOpt {
    s: String? = "abc";
    n: Int? = 42;
}

contract DefaultsInOptionals {
    x: DefaultInOpt;

    init() {
        self.x = DefaultInOpt{};
    }
}