// Edge: deeply nested optional chain combined with initialized defaults
struct Bottom {
    foo: Int?;
    bar: Bool?;
}

struct MidTier {
    low: Bottom;
    flag: Bool;
}

struct Top {
    mid: MidTier;
    val: Int;
}

contract OptionalDeepDefaults {
    state: Top;

    init() {
        self.state = Top{
            mid: MidTier{
                low: Bottom{ foo: null, bar: true },
                flag: false
            },
            val: 123
        };
    }
}