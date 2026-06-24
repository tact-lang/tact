struct InnerOpt {
    val: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
}

struct OuterOpt {
    mid: MidOpt?;
}

contract TestDeepOptional {
    content: OuterOpt = OuterOpt{ mid: null };

    init() {}
}