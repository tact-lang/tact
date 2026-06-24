// optional contract param with nested struct + defaults
struct Base {
    x: Int = 1;
    y: String = "hi";
}

struct WrapOpt {
    inner: Base?;
}

contract ParamNestedDefOpt(
    data: WrapOpt?
) {
    receive() {}
}