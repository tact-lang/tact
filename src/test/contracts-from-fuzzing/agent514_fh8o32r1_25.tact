struct DefaultAndOpt {
    a: Int = 5;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract MixedDefaultsOpts {
    data: DefaultAndOpt;
    init() {
        self.data = DefaultAndOpt{
            b: null, d: null
        };
    }
}