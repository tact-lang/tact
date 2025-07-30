// Optional struct inside optional struct inside contract param
struct Inner {
    f: Int?;
}

struct Middle {
    inner: Inner?;
}

contract ParamOptContract(
    m: Middle?,
) {}