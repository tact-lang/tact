struct DefaultNest {
    z: Int = 42;
}

struct Outer {
    opt: DefaultNest?;
}

contract OptionalDefaultedStruct {
    f: Outer;

    init() {
        self.f = Outer{ opt: null };
    }
}