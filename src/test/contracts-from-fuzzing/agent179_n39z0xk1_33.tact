struct DefaultsAndOpt {
    a: Int = 0;
    b: String?;
    c: Bool = true;
}

contract MixedDefaultsOpts {
    val: DefaultsAndOpt;
    init() {
        self.val = DefaultsAndOpt{ b: null };
    }
}