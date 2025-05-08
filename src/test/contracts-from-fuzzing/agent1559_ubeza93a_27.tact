struct Inner {
    a: Int;
}

struct OuterOptional {
    inn: Inner?;
}

contract OptionalStructField {
    f: OuterOptional;

    init() {
        self.f = OuterOptional{ inn: null };
    }
}