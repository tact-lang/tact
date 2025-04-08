// deeply nested contract param optional
struct Deep {
    val: Int;
}

contract DeepParamOpt(
    d: Deep? 
) {}