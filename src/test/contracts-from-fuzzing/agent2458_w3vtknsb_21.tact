// Optional nested Struct in contract param 
struct Wrapped {
    x: Int;
}

contract OptionalParam(
    data: Wrapped?,
) {}