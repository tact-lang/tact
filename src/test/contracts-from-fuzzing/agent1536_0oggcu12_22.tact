// Contract with optionals in deeply nested chain
struct Bot {
    foo: Int?;
    bar: Bool?;
}

struct Mid {
    child: Bot;
    baz: String?;
}

struct Top {
    mid: Mid;
}

contract DeepOptionWithin {
    data: Top;

    init() {
        self.data = Top{ mid: Mid{ child: Bot{ foo: null, bar: null }, baz: null } };
    }
}