struct InnerOptional {
    x: Int?;
}

struct OuterOptional {
    inner: InnerOptional?;
}

contract OptionalNested {
    val: OuterOptional;
    init() {
        self.val = OuterOptional{ inner: null };
    }
}