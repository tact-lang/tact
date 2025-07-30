struct OptIntBool {
    ai: Int?;
    ab: Bool?;
}

contract Test18 {
    v1: OptIntBool;
    v2: OptIntBool;
    v3: OptIntBool;

    init() {
        self.v1 = OptIntBool{ ai: 1, ab: null };
        self.v2 = OptIntBool{ ai: null, ab: true };
        self.v3 = OptIntBool{ ai: 3, ab: false };
    }
}