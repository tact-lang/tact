// optional deeply nested with default inside nested struct inside optional param
struct Sub {
    foo: Int? = null;
}

contract OptParam(
    nested: Sub?
) {}