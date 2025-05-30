// contract param optional struct with default on inner
struct Inner {
    x: Int = 999;
}
contract OptParamDefaultInner(
    val: Inner? 
) {}