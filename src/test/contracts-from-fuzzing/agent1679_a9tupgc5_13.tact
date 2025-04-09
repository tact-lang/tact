struct InnerSimple {
    a: Int = 5;
}

struct OuterOptional {
    s: InnerSimple?;
}

contract OptionalStructField {
    val: OuterOptional;

    init() {
        self.val = OuterOptional{ s: null };
    }

    receive() {}
}