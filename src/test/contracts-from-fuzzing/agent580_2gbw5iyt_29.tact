struct Inner { foo: Int }
struct Outer { inner: Inner? }

contract NestedOptionalParam(
    param1: Outer? 
) {}