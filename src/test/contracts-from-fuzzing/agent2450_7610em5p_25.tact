// Contract with some defaulted persistent state fields and overriding init
contract DefaultsOverride {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: String?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = false;
        self.d = null;
    }
}
