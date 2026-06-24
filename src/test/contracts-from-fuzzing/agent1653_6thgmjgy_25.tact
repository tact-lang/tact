struct Mix {
    a: Int;             // no default, should require init
    b: Int = 5;         // has default
    c: Bool?;           // optional defaults to null
    d: String = "x";   // has default
}

contract TestContract {
    mix: Mix;

    init() {
        // deliberately only initializing a
        self.mix = Mix{
            a: 42,
            // omitting b (default 5), c (optional null), d (default "x")
        };
    }
}