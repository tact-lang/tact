struct Mixed {
    a: Int;           // required
    b: Int?;          // optional, default null
    c: Int = 42;      // defaulted
    d: Bool? = false; // optional default false
}

contract MixedUsage {
    m: Mixed;

    init() {
        self.m = Mixed{ a:5 }; // assign required only
    }
}
