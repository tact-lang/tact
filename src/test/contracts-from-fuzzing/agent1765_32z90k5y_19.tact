contract MixedInit {
    a: Int;           // no default
    b: Bool = true;  // has default
    c: Int?;         // optional no default
    d: Bool? = null; // optional with default null

    init() {
        self.a = 123;
        self.c = 321;
        // do not assign b or d
    }
}