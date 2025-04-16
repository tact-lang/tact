struct ManyOpts {
    a: Int?; b: Int?; c: Int?; d: Int?;
}

contract ManyOptionals {
    value: ManyOpts;
    init() {
        self.value = ManyOpts{ a: null, b: null, c: null, d: null };
    }
}