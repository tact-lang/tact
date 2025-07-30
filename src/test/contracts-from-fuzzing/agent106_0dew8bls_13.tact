struct Outer {
    nested: Inner;
}

struct Inner {
    opt: Int?;
}

contract MixedDefaultsOptionals {
    field: Outer;

    init() {
        self.field = Outer{nested: Inner{opt: null}};
    }

    receive() {
        self.field = Outer{nested: Inner{opt: 5}};
    }
}