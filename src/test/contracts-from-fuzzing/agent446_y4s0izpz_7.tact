struct Defaults {
    n: Int = 0;
    b: Bool = false;
    opt: Int?;
    optb: Bool?;
}

contract Test {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}