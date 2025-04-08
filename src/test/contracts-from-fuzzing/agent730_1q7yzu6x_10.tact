struct Params {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Int?; // default null
}

contract Defaults {
    p: Params;

    init() {
        self.p = Params{};
    }
}
