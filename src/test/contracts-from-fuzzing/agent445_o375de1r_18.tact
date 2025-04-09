// Deep default assignment chain
struct End {
    v: Int = 5;
}

struct Middle {
    end: End = End{};
}

struct Start {
    mid: Middle = Middle{};
}

contract DeepDefaults {
    root: Start = Start{};
}
