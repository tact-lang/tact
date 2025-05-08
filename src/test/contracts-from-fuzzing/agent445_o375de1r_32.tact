// Combination deep nested + wide optional + defaults
struct OptLeaf {
    val: Int? = null;
}

struct MidWide {
    l1: OptLeaf? = null;
    l2: OptLeaf? = null;
    l3: OptLeaf? = null;
}

struct TopDeep {
    mid1: MidWide = MidWide{};
    mid2: MidWide = MidWide{};
}

contract ComboDeepWide {
    persist: TopDeep = TopDeep{};
}
