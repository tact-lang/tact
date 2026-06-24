struct Params {
    s: String;
    a: Int = 42;
    b: Bool = false;
}

contract DefaultsAndNested {
    p: Params;

    init() {
        self.p = Params{
            s: "Hello"
        };
    }
}
