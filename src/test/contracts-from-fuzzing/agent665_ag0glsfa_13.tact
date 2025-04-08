struct VariantFields {
    aa: Int = 1;
    bb: Bool? = null;
    cc: String = "str";
    dd: String? = null;
    ee: Int? = 5;
    ff: Bool = false;
}

contract MixDefaults {
    vf: VariantFields = VariantFields{};

    init() {
        self.vf = self.vf;
    }

    receive() {
        let _ = self.vf;
    }
}