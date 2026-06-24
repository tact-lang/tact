struct Defaults {
    a: Int = 404;
    b: String = "default";
}

contract TestContract {
    data: Defaults = Defaults{};

    init() {
        self.data = Defaults{
            a: 1,
            b: "overwrite",
        };
    }
}
