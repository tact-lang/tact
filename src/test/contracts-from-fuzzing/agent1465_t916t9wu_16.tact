struct SDefault {
    a: Int = 4;
    b: Bool = false;
}

contract InitOverride {
    s: SDefault;

    init() {
        self.s = SDefault{ a: 123, b: true };
    }
}