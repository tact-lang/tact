// Contract parameter style with nested optional struct
struct Middle {
    inner: Int?;
}

contract ParamStyleOptNested(
    val: Middle?
) {
}
