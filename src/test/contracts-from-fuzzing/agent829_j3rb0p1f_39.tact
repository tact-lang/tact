struct Defaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "s";
}

struct Wrapper {
    x: Defaults;
}

contract WrapDefaults {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            x: Defaults{},
        };
    }
}