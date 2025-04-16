struct Bottom {
    val: Int = 777;
}

struct MidLevel {
    child: Bottom;
}

struct Top {
    mid: MidLevel;
}

contract OptionalDeepDefaults {
    s: Top?;

    init() {
        self.s = null;
    }
}