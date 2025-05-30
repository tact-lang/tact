contract TestContract {
    sc1: Complex;

    init() {
        self.sc1 = Complex{
            fld1: 1,
            nested: Nested{
                f2: "ok",
                f3: Inner{
                    f4: false,
                    f5: null,
                },
            },
        };
    }

    receive() {
        let _ = self.sc1.nested.f3.f4;
    }
}

struct Complex {
    fld1: Int;
    nested: Nested;
}

struct Nested {
    f2: String;
    f3: Inner;
}

struct Inner {
    f4: Bool;
    f5: Address?;
}