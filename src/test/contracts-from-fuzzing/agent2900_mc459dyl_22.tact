struct L3 {
    t: String?;
}

struct L2 {
    inner: L3?;
}

contract DeepOptionalParam(
    l2: L2?,
) {}