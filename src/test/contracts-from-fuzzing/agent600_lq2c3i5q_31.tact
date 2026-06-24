// deeply nested optionals combined with serialization
struct Bottom {
    x: Int? as uint4;
}
struct Mid {
    sub: Bottom?;
}
struct Top {
    up: Mid?;
}
contract DeepSerOpt {
    all: Top;
    init() {
        self.all = Top{ up: null };
    }
}