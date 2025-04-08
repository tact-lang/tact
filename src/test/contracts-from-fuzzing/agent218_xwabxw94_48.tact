struct InnerOpt {
    flag: Bool?;
}

struct MidOpt {
    inner: InnerOpt?;
}

contract DeepOptNull {
    val: MidOpt?;
}