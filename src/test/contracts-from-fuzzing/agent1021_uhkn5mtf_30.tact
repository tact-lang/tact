// contract param with optional nested struct w/defaults inside
struct SomeInner {
    foo: Int = 5;
    bar: String = "hello";
}

contract ParamOptInner(
    inner: SomeInner?,
) {}