struct S {
    f1: Int?;
    f2: Bool?;
    f3: Int;
    f4: Bool;
    f5: Int?;
    f6: Bool?;
    f7: Int;
    f8: Bool;
}

contract AlternateOptionals {
    s: S;

    init() {
        self.s = S{
            f1: null, f2: true, f3: 1, f4: false,
            f5: null, f6: false, f7: 2, f8: true
        };
    }
}