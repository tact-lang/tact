struct Inner {
    v: Int;
    s: String;
}

struct Mid {
    i: Inner;
    flag: Bool;
}

contract OptionalStructField {
    data: Mid?;

    init() {
        self.data = Mid{ i: Inner{ v: 42, s: "hello" }, flag: true };
    }
}