struct Sub {
    s: String;
    i: Int;
}

struct Mid {
    optSub: Sub?;
}

contract OptionalStructField {
    data: Mid;
    init() {
        self.data = Mid{
            optSub: null
        };
    }
}
