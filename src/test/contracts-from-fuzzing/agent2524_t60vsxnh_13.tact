struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct MidOpt {
    inner: InnerOpt?;
    val: String?;
}

contract DeepOptionMix {
    mid: MidOpt = MidOpt{
        inner: null,
        val: null
    };
}