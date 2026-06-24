// optional top-level struct contract param 
struct OptParamWrap {
    fieldA: Int;
}

contract TopOptParam(
    param: OptParamWrap?
) {}