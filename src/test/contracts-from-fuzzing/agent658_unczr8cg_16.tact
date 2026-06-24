struct SDefault {
    n: Int = 1;
    b: Bool = false;
    s: String = "ok";
}

contract StructDefaultsUse {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}