struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Slice;
}

contract Test10 {
    f: HasDefaults;
    init() {
        self.f = HasDefaults{
            d: emptyCell().asSlice()
        };
    }
}