// optional contract parameter wrapping struct with default fields
struct Inner {
    a: Int = 2;
    b: Bool;
}

contract OptParamDefault(
    p: Inner?
) {}