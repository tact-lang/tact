struct NestedDefaults {
    a: Int = 10;
    b: Bool = false;
}

struct OuterOptional {
    inner: NestedDefaults?;
}

contract DefaultOptionals {
    o: OuterOptional = OuterOptional{ inner: null };

    init() {
        self.o = OuterOptional{ inner: NestedDefaults{} };
    }
}
