struct Bottom {
    z: Int = 3;
}

struct Middle {
    bot: Bottom = Bottom{};
}

struct Top {
    mid: Middle = Middle{};
}

contract LongChainDefaults {
    val: Top = Top{};
}