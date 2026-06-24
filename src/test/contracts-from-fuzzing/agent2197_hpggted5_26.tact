struct Inner {
    a: Int;
}

struct OuterOptional {
    nested: Inner?;
}

contract OutCont {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{ nested: null };
    }
}