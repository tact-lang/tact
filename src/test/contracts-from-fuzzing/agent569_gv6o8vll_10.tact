struct DefaultsAndOpts {
    a: Int = 7;
    b: String?;
    c: Bool = true;
    d: Int?;
}

contract MixDefaultsOpt {
    foo: DefaultsAndOpts;

    init() {
        self.foo = DefaultsAndOpts{b:null,d:null};
    }
}