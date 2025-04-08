struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
    str: String?;
}

contract DefaultNestedOpt {
    data: OuterOpt = OuterOpt{
        inner: InnerOpt{ val: null },
        str: null
    };
}