struct InnerOptional {
    a: Int?;
}

struct OuterOptional {
    b: InnerOptional?;
}

contract DoubleOptionalStructContract {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{ b: null };
    }
}