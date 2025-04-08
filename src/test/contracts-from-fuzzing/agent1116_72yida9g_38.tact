// large contract parameter tuple with nested struct
contract BigParam(
    a: Int,
    b: Int,
    c: Int,
    d: Int,
    e: Int,
    f: Wrapper,
){}

struct Wrapper {
    foo: Int;
}
