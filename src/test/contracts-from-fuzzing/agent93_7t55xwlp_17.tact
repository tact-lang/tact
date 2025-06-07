struct InnerMost {
    val: Int;
}

struct InnerMid {
    deep: InnerMost;
}

struct OuterMost {
    mid: InnerMid;
    note: String?;
}

contract DeepChain {
    store: OuterMost = OuterMost{
        mid: InnerMid{ deep: InnerMost{ val: 99 } },
        note: null
    };
}