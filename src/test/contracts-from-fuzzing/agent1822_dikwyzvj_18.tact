contract OptionalUninitialized {
    a: Int?;
    b: Bool?;
    c: Int;

    init() {
        self.c = 5;
        // don't assign optional a,b explicitly, should default null
    }
}