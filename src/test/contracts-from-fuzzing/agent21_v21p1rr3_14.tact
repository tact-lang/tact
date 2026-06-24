struct Defaults {
    a: Int = 10;
    b: Int = 20;
    c: Int; // no default, must be provided
}

contract TestDefaults {
    receive() {
        // Instantiate Defaults, relying on defaults for a and b
        let d: Defaults = Defaults { c: 30 };
        dump(d.a + d.b + d.c); // expect 10 + 20 + 30 = 60
        return;
    }
}
