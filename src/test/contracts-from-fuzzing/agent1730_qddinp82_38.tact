struct OptIntBool {
    x: Int?;
    y: Bool?;
}

contract OptStructs {
    s1: OptIntBool;

    init() {
        self.s1 = OptIntBool{ x: null, y: true };
    }
}