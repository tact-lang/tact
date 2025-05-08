// testing order of field init w.r.t default and override
contract DefOverride {
    a: Int = 5;
    b: Int = 6;

    init() {
        self.b = 100;
    }
}